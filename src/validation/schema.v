module validation

pub struct Schema {
	rules    []Rule
	reporter Reporter = default_reporter()
}

pub fn schema() Schema {
	return Schema{}
}

pub fn (mut s Schema) add_rule(rule Rule) {
	s.rules << rule
}

pub fn (s Schema) validate(val any) ? {
	for rule in s.rules {
		if rule.is_validation {
			res := rule.apply(val) or {
				s.reporter.report(rule.message, val)
				return error(rule.message)
			}
		}
	}
	return
}

pub fn (s Schema) sanitize(val any) ?any {
	mut result := val
	for rule in s.rules {
		if !rule.is_validation {
			result = rule.apply(result) or {
				s.reporter.report(rule.message, result)
				return none
			}
		}
	}
	return result
}
