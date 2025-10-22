module testing

pub struct Ensure {
	value   any
	negated bool
}

pub fn ensure(val any) Ensure {
	return Ensure{val, false}
}

pub fn (e Ensure) not() Ensure {
	return Ensure{e.value, !e.negated}
}

pub fn (e Ensure) is(type_name string) {
	correct := typeof(e.value).name == type_name
	if e.negated == correct {
		panic('Ensure failed: Expected type ${if e.negated { 'not ' } else { '' }}${type_name}')
	}
}
