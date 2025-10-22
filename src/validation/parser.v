module validation

pub struct Parser {
	value string
}

pub fn parse(val any) Parser {
	return Parser{val.str()}
}

pub fn (p Parser) to_bool() ?bool {
	return match p.value.to_lower() {
		'true' { true }
		'false' { false }
		else { none }
	}
}
