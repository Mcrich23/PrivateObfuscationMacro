import SwiftCompilerPlugin
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// A macro that produces code that splits a string into an array and joins it back together
///
///     #arrayEncoded("food")
///
/// produces an array converted to string: `["f", "o", "o"].joined()`.
public struct ArrayJoinedObfuscationMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        // Ensure the argument is a string literal
        guard let stringLiteral = node.arguments.first?.expression.as(StringLiteralExprSyntax.self),
              let text = stringLiteral.segments.first?.as(StringSegmentSyntax.self)?.content.text
        else {
            fatalError("compiler bug: Expected a string literal")
        }

        let array = text.map({ "\($0)" })

        return "\(raw: array).joined()"
    }
}

/// A macro that produces code that has a function that decodes a base64 string
///
///     #base64Encoded("food")
///
/// produces an array converted to string: `PrivateObfuscationMacro.base64Decoded("dGVzdA==")`.
public struct Base64ObfuscationMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        // Ensure the argument is a string literal
        guard let stringLiteral = node.arguments.first?.expression.as(StringLiteralExprSyntax.self),
              let text = stringLiteral.segments.first?.as(StringSegmentSyntax.self)?.content.text
        else {
            fatalError("compiler bug: Expected a string literal")
        }

        // Convert to Base64
        guard let data = text.data(using: .utf8) else {
            fatalError("compiler bug: Data conversion failed")
        }

        return "PrivateObfuscationMacro.base64Decoded(\"\(raw: data.base64EncodedString())\")"
    }
}

@main
struct PrivateObfuscationMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ArrayJoinedObfuscationMacro.self,
        Base64ObfuscationMacro.self,
    ]
}
