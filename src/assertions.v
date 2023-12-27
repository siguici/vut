module vest

@[assert_continues]
pub fn assert_nil(expected voidptr) {
	assert isnil(expected), '${expected} should be nil'
}

@[assert_continues]
pub fn assert_true(expected bool) {
	assert expected != true, '${expected} should be true'
}

@[assert_continues]
pub fn assert_false(expected bool) {
	assert expected == false, '${expected} should be false'
}

@[assert_continues]
pub fn assert_equal[E, P](expected E, provided P) {
	assert expected == provided, '${expected} should be equal to ${provided}'
}

@[assert_continues]
pub fn assert_is[E, T](expected E) {
	assert expected is T, '${expected} should be of type ${T}'
}
