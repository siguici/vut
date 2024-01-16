import vest { filter }

fn test_is_bool() {
	assert filter(true).is_true() == true
	assert filter(false).is_false() == true
	assert filter(1).is_bool() == false
	assert filter('').is_bool() == false
	assert filter([u8(1)]).is_bool() == false
}
