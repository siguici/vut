module validation

pub struct Filter {
	value any
}

pub fn filter(val any) Filter {
	return Filter{val}
}

pub fn (f Filter) is_bool() bool {
	return typeof(f.value).name == 'bool'
}

pub fn (f Filter) is_string() bool {
	return typeof(f.value).name == 'string'
}
