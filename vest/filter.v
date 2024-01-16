module vest

pub struct Filtering[T] {
	value T
}

pub fn Filtering.of[T](value T) Filtering[T] {
	return Filtering{value}
}

pub fn filter[T](value T) Filtering[T] {
	return Filtering.of(value)
}