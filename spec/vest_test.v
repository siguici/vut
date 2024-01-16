import vest { filter }

fn test_bool() {
	assert filter(true).is_true() == true
	assert filter(false).is_false() == true
	assert filter(1).is_bool() == false
	assert filter('').is_bool() == false
	assert filter([u8(1)]).is_bool() == false
}

fn test_num() {
	assert filter(12).is_num() == true
	assert filter('12').is_num() == false
	assert filter(1).is_int() == true
	assert filter(false).is_int() == false
	assert filter(1.5).is_float() == true
	assert filter(1.5).is_int() == false
}
