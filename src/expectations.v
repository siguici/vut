module vest

@[params]
struct Expectation[E] {
	expected E
}

pub fn expect[E](expected E) Expectation[E] {
	return Expectation[E]{expected}
}

pub fn expect_bool(expected bool) Expectation[bool] {
	return Expectation{expected}
}

pub fn (expectation Expectation[voidptr]) to_be_nil() Expectation[voidptr] {
	assert_nil(expectation.expected)
	return expectation
}

pub fn (expectation Expectation[bool]) to_be_true() Expectation[bool] {
	assert_true(expectation.expected)
	return expectation
}

pub fn (expectation Expectation[bool]) to_be_false() Expectation[bool] {
	assert_false(expectation.expected)
	return expectation
}

pub fn (expectation Expectation[E]) to_equal[P](provided P) Expectation[E] {
	assert_equal(expectation.expected, provided)
	return expectation
}

pub fn (expectation Expectation[E]) assert_is[T]() Expectation[E] {
	assert_is[T](expectation.expected)
	return expectation
}
