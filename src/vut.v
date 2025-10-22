module vut

import v.vmod
import os
import cli
import term

const logo = '
 ██╗   ██╗ ██╗   ██╗ ████████╗
 ██║   ██║ ██║   ██║ ╚══██╔══╝
 ██║   ██║ ██║   ██║    ██║
 ╚██╗ ██╔╝ ██║   ██║    ██║
  ╚████╔╝  ╚██████╔╝    ██║
   ╚═══╝    ╚═════╝     ╚═╝'

const manifest = vmod.decode(@VMOD_FILE) or { panic(err) }
const vexe = os.real_path(os.getenv_opt('VEXE') or { @VEXE })

pub fn run(args []string) {
	mut app := cli.Command{
		name:        manifest.name
		version:     manifest.version
		description: manifest.description
		usage:       'vut [test.v] [test.v ...]'
		execute:     fn (cmd cli.Command) ! {
			args := cmd.args
			println(term.blue(logo))
			if args.len < 1 {
				h := cmd.help_message()
				println(h)
				exit(0)
			}
			r := os.execute('${vexe} test ${args.join(' ')}')
			expect(r.exit_code).to_equal(0)
			// vut.expect(r.output).to_be_string()
		}
	}

	app.setup()
	app.parse(args)
}

pub interface SanitizerContract[T] {
	reason string
	apply(value T) ?T
}

pub interface ValidatorContract[T] {
	check(value T) !
}

pub interface ReporterContract[T] {
	report(string, T)
}

pub type SanitizerCallback[T] = fn (value T) ?T

pub type ValidatorCallback[T] = fn (value T) !

@[params]
pub struct SchemaConfig[T] {
	reporter ReporterContract[T]
}

pub struct Schema[T] {
	reporter   ReporterContract[T]
	sanitizers map[string]SanitizerContract[T]
	validators map[string]ValidatorContract[T]
}

pub fn Schema.new[T](options SchemaConfig[T]) Schema {
	return Schema{options.reporter}
}

pub fn (this Schema[T]) sanitize[T](value T) T {
	for sanitizer in this.sanitizers {
		value = sanitizer.apply(value) or {
			this.reporter.report(sanitizer.reason, value)
			return value
		}
	}
	return value
}

pub fn (this Schema[T]) validate[T](value T) bool {
	for validator in this.validators {
		validator.validate(value) or {
			this.reporter.report(err, value)
			return false
		}
	}
	return true
}
