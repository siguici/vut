module vut

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

pub struct Parsing[T] {
	value T
}

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
