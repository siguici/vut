# ⚡️ VUT — Vlang Validation Utilities & Unit Testing Framework

> **VUT** is a next-generation all-in-one framework for **data validation**,
**assertion**, and **unit testing** in [Vlang](https://vlang.io).  
> Inspired by the best of **Zod**, **Jest**, **PestPHP**,
and **Laravel Validation**, it brings a modern, elegant,
and powerful developer experience — all in native V 🚀

---

## ✨ Features

- 🧠 **Validation Engine** — Type-safe, chainable, expressive (`string().email().min(3)`)
- ⚖️ **Unit Testing** — `describe`, `it`, `test.each`, `expect` & matchers
- 🌈 **Rich Reporters** — Console, JSON & TAP with beautiful colors and emojis
- 🧩 **Schema-based Validation** — Compose complex structures like Zod or Vine
- 🧪 **Spies & Mocks** — Observe function calls, arguments & results
- 🚦 **Tree View** — Hierarchical test runner with ✅ ❌ ⚪ indicators
- 🔄 **Async & Timeout** support (future-proof for coroutines)

---

## 📦 Installation

### Via VPM (recommended)

```bash
v install siguici.vut
````

### Via Git

```bash
mkdir -p ${VMODULES:-$HOME/.vmodules}/siguici
git clone --depth=1 https://github.com/siguici/vut ${VMODULES:-$HOME/.vmodules}/siguici/vut
```

### As a project dependency

```v
Module {
    dependencies: [
        'siguici.vut'
    ]
}
```

---

## 🚀 Quick Start

### 🧹 Filtering (runtime type helpers)

```v
import vut { filter }

assert filter(true).is_bool()
assert filter(true).is_true()
assert filter(2).is_any_int()
assert filter(5.4).is_any_float()
assert filter(8).is_num() // int or float
```

---

### 🛡 Assurance (chained assertions)

```v
import vut { ensure }

t := true

ensure(t).is_bool().is_true()
```

---

### 🔍 Expectations (unit testing style)

```v
import vut { expect }

t := true

expect(t).to_be_bool().to_be_true()
```

---

## 🧠 Validation Engine (Vest)

```v
import vut { string, number, boolean }

name_schema := string().required().min(3).max(50)
email_schema := string().email()
age_schema := number().integer().min(18)
consent_schema := boolean()

// ✅ Validate values
name := 'John Doe'
email := 'john@example.com'
age := 25
consent := true

println(name_schema.validate(name, 'name')) // -> ok: true
println(email_schema.validate(email, 'email'))
println(age_schema.validate(age, 'age'))
println(consent_schema.validate(consent, 'consent'))
```

---

## 🧩 Complex Schemas

```v
import vut { Schema, string, number }

struct User {
    name  string
    email string
    age   int
}

user_schema := Schema[User]{
    fields: {
        'name':  string().min(3).max(50)
        'email': string().email()
        'age':   number().integer().min(18)
    }
}

result := user_schema.validate({
    name: 'Alice',
    email: 'alice@example.com',
    age: 22
})

if result.ok {
    println('✅ Validation passed!')
} else {
    for err in result.errors {
        println('❌ ${err.path}: ${err.message}')
    }
}
```

---

## 🧪 Testing Suite (VUTest)

### Example: describe / it / expect syntax

```v
import vut { describe, it, expect }

describe('Math utilities 🌳') {
    it('adds numbers correctly') {
        expect(2 + 2).to_equal(4)
    }

    it('handles floats precisely') {
        expect(0.1 + 0.2).to_be_close_to(0.3, 0.001)
    }

    it('is skipped for now').skip()
    it('is planned later').todo()
}
```

### Nested Groups

```v
describe('User module') {
    describe('Validation') {
        it('accepts valid email') {
            expect('john@example.com').to_match(r'.+@.+')
        }
    }

    describe('Authentication') {
        it('should login successfully') {
            expect(true).to_be_true()
        }
    }
}
```

---

## 🧰 Advanced Matchers

| Matcher                                          | Description                    |
| ------------------------------------------------ | ------------------------------ |
| `.to_equal(expected)`                            | Deep equality check            |
| `.to_be_true()` / `.to_be_false()`               | Boolean checks                 |
| `.to_be_greater_than(n)` / `.to_be_less_than(n)` | Numeric comparison             |
| `.to_contain(sub)`                               | String / Array containment     |
| `.to_match(regex)`                               | Regex pattern match            |
| `.to_throw()`                                    | Expects a panic or error       |
| `.to_be_close_to(value, delta)`                  | Floating-point precision match |
| `.to_pass(schema)`                               | Passes validation schema       |

---

## 🕵️ Spies & Mocks

```v
import vut { spy }

mut fn add(a int, b int) int {
    return a + b
}

mut s := spy(add)

s.call(2, 3)
s.call(1, 4)

expect(s.call_count).to_equal(2)
expect(s.called_with(1, 4)).to_be_true()
expect(s.returned(5)).to_be_true()
```

---

## 🔄 Parameterized Tests (test.each)

```v
import vut { test }

test.each([
    [2, 3, 5],
    [10, 5, 15],
])('adds numbers correctly') { a, b, expected ->
    expect(a + b).to_equal(expected)
}
```

---

## 🧾 Reporters

VUT supports multiple output styles for your tests and CI pipelines:

| Reporter       | Description                           |
| -------------- | ------------------------------------- |
| 🖥 **Console** | Pretty tree view with colors & emojis |
| 📄 **JSON**    | Structured JSON for CI tools          |
| 🧱 **TAP**     | Test Anything Protocol output         |

Example output in console:

```
🌳 VUT Test Suite
├── User module
│   ├── Validation
│   │   ✅ accepts valid email
│   └── Authentication
│       ⚪ should login successfully (skipped)
└── Math utilities
    ❌ adds numbers correctly
    🟡 is planned later (todo)

Summary: ✅ 3 passed | ❌ 1 failed | ⚪ 1 skipped | 🟡 1 todo
```

---

## 🚦 Status Indicators

| Symbol | Meaning |
| ------ | ------- |
| ✅      | Passed  |
| ❌      | Failed  |
| ⚪      | Skipped |
| 🟡     | Todo    |

---

## 🧠 Philosophy

> **VUT = Validation + Utility + Test**

A single framework that unifies **validation**
and **unit testing** with the same philosophy:

- Intuitive
- Fluent
- Expressive
- Fully native to V

---

## 🧩 Roadmap

- [ ] Async test support
- [ ] File-based test discovery
- [ ] Plugin system (custom matchers & reporters)
- [ ] Schema-based transformations
- [ ] Integration with `v fmt` and `v test`

---

## 🪪 License

MIT © [Sigui Kessé Emmanuel](https://github.com/siguici)

---

## 💬 Connect

- 🐙 GitHub: [github.com/siguici/vut](https://github.com/siguici/vut)
- 💬 Discussions: [GitHub Discussions](https://github.com/siguici/vut/discussions)
- 💡 Issues & Suggestions: [Submit an Issue](https://github.com/siguici/vut/issues)

---

> Made with ❤️ by [Sigui Kessé Emmanuel](https://github.com/siguici)
> For the next generation of Vlang developers ⚙️🚀
