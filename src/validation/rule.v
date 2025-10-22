module validation

type RuleFn = fn (val any) ?any

pub struct Rule {
	name          string
	apply         RuleFn
	message       string
	is_validation bool
}

pub fn new_rule(name string, apply RuleFn, message string, is_validation bool) Rule {
	return Rule{name, apply, message, is_validation}
}

pub fn is_bool() Rule {
	return Rule{
		name:    'is_bool'
		message: 'Expected a boolean'
		check:   fn (val any) ? {
			if typeof(val).name == 'bool' {
				return
			}
			return error('Expected a boolean')
		}
	}
}
