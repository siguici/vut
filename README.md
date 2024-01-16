# Validation and Unit Testing Framework for Vlang

VUT is a minimalistic framework for validating rules and conducting unit tests in Vlang.
Simplify code validation and ensure component correctness effortlessly.

## Installation

- Install VUT using VPM (recommanded):

```shell
v install siguici.vut
```

- Install VUT using Git:

```shell
mkdir ${V_MODULES:-$HOME/.vmodules}/siguici
git  clone --depth=1 https://github.com/siguici/vut ${V_MODULES:-$HOME/.vmodules}/siguici/vut
```

- Use VUT as a project dependency:

```v
Module {
    //...
	dependencies: [
        'siguici.vut'
        //...
    ]
}

```

## Usage

### Filtering

```v
import vut { filter }

assert filter(true).is_bool()
assert filter(true).is_true()
assert filter(2).is_any_int()
assert filter(5.4).is_any_float()
assert filter(8).is_num() // any_int or any_float
```

### Assurance

```v
import vut { ensure }

t := true

ensure(t).is_bool().is_true()
```

### Expectation

```v
import vut { expect }

t := true

expect(t).to_be_bool().to_be_true()
```
