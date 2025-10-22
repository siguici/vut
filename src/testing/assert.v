module testing

pub fn assert_eq(val any, expected any) {
	assert val == expected, 'Assertion failed: ${val} != ${expected}'
}

pub fn assert_type(val any, type_name string) {
	assert typeof(val).name == type_name, 'Assertion failed: Expected type ${type_name}, got ${typeof(val).name}'
}
