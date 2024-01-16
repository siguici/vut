import vunit { assert_nil, assert_bool, assert_true, assert_false, expect }

fn test_assert_nil() {
	assert_nil(unsafe { nil })
}

fn test_assert_bool() {
	assert_bool(true)
	assert_bool(false)
	assert_true(true)
	assert_false(false)
}

fn test_primitive() {
	expect(false).to_be_primitive()
	expect(2).to_be_primitive()
	expect(2.4).to_be_primitive()
	expect(`a`).to_be_primitive()
	expect('hello').to_be_primitive()
}
