# VUT Feature Roadmap

## Vest

- [ ] **Validation Filter:**
  - Implement a filter for validation with an expressive syntax.
  - Example: `filter(val).is_bool()`.

- [ ] **Transformation Parser:**
  - Add a parser for transforming values.
  - Example: `parse(val).to_bool()`.

- [ ] **Schema Management:**
  - Implement schema management to encapsulate validation and cleanup rules.
  - Allow the addition of validators and sanitizers to schemas.
  - Expose methods like `schema.validate(value)` and `schema.sanitize(value)`.
  - Add methods for dynamic addition of specific rules and validations/sanitizations.
  - Example:
    ```v
    my_schema := schema[string].new(reporter, rules, reason)
    my_schema.add_validator(my_validator)
    my_schema.add_rule('custom_rule', callback, 'Custom rule failed')
    ```

- [ ] **Error Handling:**
  - Integrate a reporting system to handle errors.
  - Allow the use of different reporters such as Logger, Error, Output, etc.
  - If no reporter is provided, panic on error.
  - Example:
    ```v
    my_schema := schema[string].new(reporter, rules, reason)
    my_schema.validate(value) // Error report on failure
    ```

## VUnit

- [ ] **Expectation:**
  - Implement expectation functions for specific checks.
  - Example: `expect(value).to_be(type)`.

- [ ] **Assertion:**
  - Add assertions for immediate checks.
  - Example: `assert(value, type)`.

- [ ] **Assurance:**
  - Integrate assurances for extended checks.
  - Example: `ensure(value).is(type)`.

- [ ] **Negation Handling:**
  - Allow negation handling in assurances.
  - Example: `ensure(value).not.is(type).eq(other)`.

- [ ] **Customized Messages:**
  - Add the ability to customize expectation messages.
  - Example: `Expectation.set_message('to_be', message)`.

- [ ] **Extension:**
  - Allow extension of validation, transformation, and schema features.
  - Example: `Expectation.extend('to_be', type, fn(i ...Input) => Result)`.

- [ ] **Parser, Filter, Schema:**
  - Implement parsers, filters, and schemas for more advanced usage.
  - Example: `Parser.parse(value, format)`.

This roadmap covers a variety of features to enhance flexibility, expressiveness, and customization in Vest and VUnit. It can be adjusted based on project evolution and user feedback.
