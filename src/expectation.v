module vest

@[params]
struct Expectation[E] {
	expected E
}

pub fn expect[E](expected E) Expectation[E] {
	return Expectation[E]{expected}
}

fn (expectation Expectation[E]) is_nil() {
	assert isnil(expectation.expected), '${expectation.expected} should be nil'
}

fn (expectation Expectation[E]) is_not_nil() {
	assert !isnil(expectation.expected), '${expectation.expected} should not be nil'
}

fn (expectation Expectation[E]) equal[P](provided P) {
	assert expectation.expected == provided, '${expectation.expected} should be equal to ${provided}'
}

fn (expectation Expectation[E]) not_equal[P](provided P) {
	assert expectation.expected != provided, '${expectation.expected} should not be equal to ${provided}'
}
