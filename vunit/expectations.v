module vunit

struct Expectation[T] {
	val T
}

pub fn expect[T](val T) Expectation[T] {
	return Expectation[T]{val}
}

pub fn (this Expectation[T]) to_be_nil() Expectation[T] {
	assert_nil(this.val)
	return this
}

pub fn (this Expectation[T]) to_be_bool() Expectation[T] {
	assert_bool(this.val)
	return this
}

pub fn (this Expectation[bool]) to_be_true() Expectation[bool] {
	assert_true(this.val)
	return this
}

pub fn (this Expectation[bool]) to_be_false() Expectation[bool] {
	assert_false(this.val)
	return this
}

pub fn (this Expectation[T]) to_equal[P](provided P) Expectation[T] {
	assert_equal(this.val, provided)
	return this
}

pub fn (this Expectation[T]) to_be[E]() Expectation[T] {
	assert_is[E, T](this.val)
	return this
}

pub fn (this Expectation[T]) to_be_primitive() Expectation[T] {
	assert_primitive(this.val)
	return this
}
