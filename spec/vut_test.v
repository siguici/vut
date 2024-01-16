import vut { ensure, expect, filter }

fn test_nil() {
	assert filter(unsafe { nil }).is_nil()
	assert !filter('').is_nil()
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

fn test_nil_unit() {
	ensure(unsafe { nil }).is_nil()
	expect(unsafe { nil }).to_be_nil()
}

fn test_bool_unit() {
	ensure(true).is_bool().is_true()
	ensure(false).is_bool().is_false()
	expect(true).to_be_bool().to_be_true()
	expect(false).to_be_bool().to_be_false()
}

fn test_primitive() {
	expect(false).to_be_primitive()
	expect(2).to_be_primitive()
	expect(2.4).to_be_primitive()
	expect(`a`).to_be_primitive()
	expect('hello').to_be_primitive()
}
