module vest

pub struct Filtering[T] {
	value T
}

pub fn Filtering.of[T](value T) Filtering[T] {
	return Filtering[T]{value}
}

pub fn filter[T](value T) Filtering[T] {
	return Filtering.of(value)
}

pub fn (this Filtering[T]) is_bool() bool {
	return $if this.value is bool {
		true
	} $else {
		false
	}
}
