module vest

@[params]
struct Expectation[E] {
	expected E
}

@[params]
struct BoolExpectation {
	Expectation[bool]
}

@[params]
struct StringExpectation {
	Expectation[string]
}

@[params]
struct RuneExpectation {
	Expectation[rune]
}

@[params]
struct I8Expectation {
	Expectation[i8]
}

@[params]
struct U8Expectation {
	Expectation[u8]
}

@[params]
struct I16Expectation {
	Expectation[i16]
}

@[params]
struct U16Expectation {
	Expectation[u16]
}

@[params]
struct IntExpectation {
	Expectation[int]
}

@[params]
struct U32Expectation {
	Expectation[u32]
}

@[params]
struct I64Expectation {
	Expectation[i64]
}

@[params]
struct U64Expectation {
	Expectation[u64]
}

@[params]
struct F32Expectation {
	Expectation[f32]
}

@[params]
struct F64Expectation {
	Expectation[f64]
}

@[params]
struct ISizeExpectation {
	Expectation[isize]
}

@[params]
struct USizeExpectation {
	Expectation[usize]
}

@[params]
struct VoidptrExpectation {
	Expectation[voidptr]
}

pub fn expect[E](expected E) Expectation[E] {
	return Expectation[E]{expected}
}

pub fn expect_bool(expected bool) BoolExpectation {
	return BoolExpectation{
		expected: expected
	}
}

pub fn (expectation VoidptrExpectation) to_be_nil() VoidptrExpectation {
	assert_nil(expectation.expected)
	return expectation
}

pub fn (expectation BoolExpectation) to_be_true() BoolExpectation {
	assert_true(expectation.expected)
	return expectation
}

pub fn (expectation BoolExpectation) to_be_false() BoolExpectation {
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
