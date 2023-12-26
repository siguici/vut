module vest

@[params]
struct Expectation[E] {
	expected E
}

pub fn expect[E](expected E) Expectation[E] {
	return Expectation[E]{expected}
}

pub fn (expectation Expectation[E]) is_nil() {
	assert isnil(expectation.expected), '${expectation.expected} should be nil'
}

pub fn (expectation Expectation[E]) is_not_nil() {
	assert !isnil(expectation.expected), '${expectation.expected} should not be nil'
}

pub fn (expectation Expectation[E]) equal[P](provided P) {
	assert expectation.expected == provided, '${expectation.expected} should be equal to ${provided}'
}

pub fn (expectation Expectation[E]) not_equal[P](provided P) {
	assert expectation.expected != provided, '${expectation.expected} should not be equal to ${provided}'
}
