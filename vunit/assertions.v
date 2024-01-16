module vunit

import vest { filter }

const primitive_types = ['bool', 'string', 'rune', 'i8', 'u8', 'i16', 'u16', 'int', 'u32', 'i64',
	'u64', 'isize', 'usize', 'f32', 'f64', 'voidptr']

@[assert_continues]
fn assert_that[E, P](assertion bool, expected E, val P) {
	assert assertion, '`${expected}` expected, but `${val}` val'
}

fn assert_type[T](assertion bool, val T, typ string) {
	assert_that(assertion, typ, typeof(val).name)
}

pub fn assert_nil[T](val T) {
	assert_type(filter(val).is_nil(), val, 'nil')
}

pub fn assert_bool[T](val T) {
	assert_type(filter(val).is_bool(), val, 'bool')
}

pub fn assert_equal[E, P](expected E, val P) {
	assert_that(expected == val, expected, val)
}

pub fn assert_true(val bool) {
	assert_equal(val, true)
}

pub fn assert_false(val bool) {
	assert_equal(val, false)
}

pub fn assert_is[T, P](val P) {
	assert_that(val is T, T, typeof(val).name)
}

pub fn assert_primitive[P](val P) {
	p_type := typeof(val).name
	assert_that(p_type in vunit.primitive_types, 'primitive', p_type)
}
