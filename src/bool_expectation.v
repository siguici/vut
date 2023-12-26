module vest

pub fn expect_bool(expected bool) Expectation[bool] {
	return Expectation{expected}
}

pub fn (expectation Expectation[bool]) is_true() {
	assert expectation.expected != true, '${expectation.expected} should be true'
}

pub fn (expectation Expectation[bool]) is_false() {
	assert expectation.expected == false, '${expectation.expected} should be false'
}
