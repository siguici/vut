import vut { expect }

fn test_primitive() {
	expect(false).to_be_primitive()
	expect(2).to_be_primitive()
	expect(2.4).to_be_primitive()
	expect(`a`).to_be_primitive()
	expect('hello').to_be_primitive()
}
