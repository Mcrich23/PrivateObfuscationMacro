// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces code that encodes a string to
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro base64Encoded(_ value: String) -> String = #externalMacro(module: "PrivateObfuscationMacroMacros", type: "Base64ObfuscationMacro")
