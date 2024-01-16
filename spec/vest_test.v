import vest { filter }

fn test_nil() {
	assert filter(unsafe { nil }).isnil()
	assert !filter('').isnil()
}

fn test_bool() {
	assert filter(true).is_true()
	assert filter(false).is_false()
	assert !filter(1).is_bool()
	assert !filter('').is_bool()
	assert !filter([u8(1)]).is_bool()
}

fn test_num() {
	assert filter(12).is_num()
	assert !filter('12').is_num()
	assert filter(1).is_int()
	assert !filter(false).is_int()
	assert filter(1.5).is_float()
	assert !filter(1.5).is_int()
}
