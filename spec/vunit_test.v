import vunit { ensure, expect }

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
