// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces code that splits a string into an array and joins it back together
///
///     #stringify("food)
///
/// produces an array converted to string: `["f", "o", "o"].joined()`.
@freestanding(expression)
public macro arrayEncoded(_ value: String) -> String = #externalMacro(module: "PrivateObfuscationMacroMacros", type: "ArrayJoinedObfuscationMacro")
