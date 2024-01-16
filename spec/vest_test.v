import vest { filter }

fn test_is_bool() {
	assert filter(true).is_bool() == true
	assert filter(false).is_bool() == true
	assert filter(1).is_bool() == false
	assert filter('').is_bool() == false
	assert filter([u8(1)]).is_bool() == false
}
