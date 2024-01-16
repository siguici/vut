module vut

pub struct Parsing[T] {
	value T
}

pub fn Parsing.from[T](value T) Parsing[T] {
	return Parsing[T]{value}
}

pub fn parse[T](value T) Parsing[T] {
	return Parsing.from(value)
}
