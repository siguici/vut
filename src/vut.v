module main

import v.vmod
import os
import cli
import term
import vut

const logo = '
 ██╗   ██╗ ██╗   ██╗ ████████╗
 ██║   ██║ ██║   ██║ ╚══██╔══╝
 ██║   ██║ ██║   ██║    ██║
 ╚██╗ ██╔╝ ██║   ██║    ██║
  ╚████╔╝  ╚██████╔╝    ██║
   ╚═══╝    ╚═════╝     ╚═╝'

const manifest = vmod.decode(@VMOD_FILE) or { panic(err) }
const vexe = os.real_path(os.getenv_opt('VEXE') or { @VEXE })

pub fn main() {
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
			vut.expect(r.exit_code).to_equal(0)
		}
	}

	app.setup()
	app.parse(os.args)
}
