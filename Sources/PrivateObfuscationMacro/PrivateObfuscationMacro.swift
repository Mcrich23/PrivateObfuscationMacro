// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

/// A macro that produces code that splits a string into an array and joins it back together
///
///     #arrayEncoded("food")
///
/// produces an array converted to string: `["f", "o", "o", "d"].joined()`.
@freestanding(expression)
public macro arrayEncoded(_ value: String) -> String = #externalMacro(module: "PrivateObfuscationMacroMacros", type: "ArrayJoinedObfuscationMacro")

/// A macro that produces code that has a function that decodes a base64 string
///
///     #base64Encoded("food")
///
/// produces an array converted to string: `PrivateObfuscationMacro.base64Decoded("dGVzdA==")`.
@freestanding(expression)
public macro base64Encoded(_ value: String) -> String? = #externalMacro(module: "PrivateObfuscationMacroMacros", type: "Base64ObfuscationMacro")


public func base64Decoded(_ string: String) -> String? {
    guard let data = Data(base64Encoded: string) else {
        return nil
    }
    
    return String(data: data, encoding: .utf8)
}
