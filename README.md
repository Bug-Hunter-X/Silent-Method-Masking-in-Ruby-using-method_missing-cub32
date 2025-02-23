# Silent Method Masking in Ruby's method_missing

This repository demonstrates a subtle bug in Ruby where the use of `method_missing` can silently mask the existence of methods inherited from superclasses.  The bug occurs when a subclass inherits methods, but a custom `method_missing` implementation intercepts all calls to undefined methods.  This can lead to unexpected behavior where inherited methods are never called.  The example shows how to avoid this pitfall.

## How to Reproduce
1. Clone this repository.
2. Run `ruby bug.rb`
3. Observe the output; the `defined_method` from `MySubclass` is not called despite being defined.

## Solution
The provided solution clarifies that while using `method_missing` is great for dynamic method handling, we must ensure it does not shadow existing methods inadvertently. The corrected approach is to explicitly check for methods' existence before delegating to `method_missing`.  This improved approach retains the power of `method_missing` for truly undefined methods while not preventing access to properly defined methods.