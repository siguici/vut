module validation

interface Reporter {
	report(msg string, val any)
}

struct DefaultReporter {}

pub fn default_reporter() Reporter {
	return DefaultReporter{}
}

pub fn (r DefaultReporter) report(msg string, val any) {
	println('Validation failed: ${msg} | value: ${val}')
}
