module vut

pub type InsuranceFn[T] = fn (this Insurance[T]) Insurance[T]

struct Insurance[T] {
	val T
}

pub fn ensure[T](val T) Insurance[T] {
	return Insurance[T]{val}
}

pub fn (this Insurance[T]) is(insurance_fn InsuranceFn[T]) Insurance[T] {
	return insurance_fn[T](this)
}

pub fn (this Insurance[T]) is_nil() Insurance[T] {
	if !filter(this.val).is_nil() {
		panic('${this.val} is not nil')
	}
	return this
}

pub fn (this Insurance[T]) is_bool() Insurance[T] {
	if !filter(this.val).is_bool() {
		panic('${this.val} is not bool')
	}
	return this
}

pub fn (this Insurance[bool]) is_true() Insurance[bool] {
	if !filter(this.val).is_true() {
		panic('${this.val} is not true')
	}
	return this
}

pub fn (this Insurance[bool]) is_false() Insurance[bool] {
	if !filter(this.val).is_false() {
		panic('${this.val} is not false')
	}
	return this
}
