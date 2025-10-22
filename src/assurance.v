module vut

pub type AssuranceFn[T] = fn (this Assurance[T]) Assurance[T]

struct Assurance[T] {
	val T
}

pub fn ensure[T](val T) Assurance[T] {
	return Assurance[T]{val}
}

pub fn (this Assurance[T]) is(assurance_fn AssuranceFn[T]) Assurance[T] {
	return assurance_fn[T](this)
}

pub fn (this Assurance[T]) is_nil() Assurance[T] {
	if !filter(this.val).is_nil() {
		panic('${this.val} is not nil')
	}
	return this
}

pub fn (this Assurance[T]) is_bool() Assurance[T] {
	if !filter(this.val).is_bool() {
		panic('${this.val} is not bool')
	}
	return this
}

pub fn (this Assurance[bool]) is_true() Assurance[bool] {
	if !filter(this.val).is_true() {
		panic('${this.val} is not true')
	}
	return this
}

pub fn (this Assurance[bool]) is_false() Assurance[bool] {
	if !filter(this.val).is_false() {
		panic('${this.val} is not false')
	}
	return this
}
