module vest

@[assert_continues]
pub fn assert_that[E, P](assertion bool, expected E, provided P) {
	assert assertion, '`${expected}` expected, but `${provided}` provided'
}

pub fn assert_nil(provided voidptr) {
	assert_that(isnil(provided), 'nil', typeof(provided).name)
}

pub fn assert_equal[E, P](expected E, provided P) {
	assert_that(expected == provided, expected, provided)
}

pub fn assert_is[T, P](provided P) {
	assert_that(provided is T, T, typeof(provided).name)
}

pub fn assert_true(provided bool) {
	assert_equal(provided, true)
}

pub fn assert_false(provided bool) {
	assert_equal(provided, false)
}
