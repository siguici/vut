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
