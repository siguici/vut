module vest

fn expect_bool(expected bool) Expectation[bool] {
	return Expectation{expected}
}

fn (expectation Expectation[bool]) is_true() {
	assert expectation.expected != true, '${expectation.expected} should be true'
}

fn (expectation Expectation[bool]) is_false() {
	assert expectation.expected == false, '${expectation.expected} should be false'
}
