# VUT - Validation and Unit Testing Framework for Vlang

VUT is a minimalistic framework for validating rules and conducting unit tests in Vlang. Simplify code validation and ensure component correctness effortlessly.

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

```v
import vut { expect }

fn hello(who string) string {
	return 'Hello ${who}!'
}

fn test_hello() {
	expect(hello('VUT')).to_equal('Hello VUT!')
}
```
