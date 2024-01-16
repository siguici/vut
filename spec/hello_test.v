import vut { expect }

fn hello(who string) string {
	return 'Hello ${who}!'
}

fn test_hello() {
	expect(hello('VUT')).to_equal('Hello VUT!')
}
