import vest { expect }

fn hello(who string) string {
	return 'Hello ${who}!'
}

fn test_hello() {
	expect(hello('Vest')).to_equal('Hello Vest!')
}
