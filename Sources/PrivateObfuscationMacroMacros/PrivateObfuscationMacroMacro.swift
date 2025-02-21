import SwiftCompilerPlugin
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
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

        return .init(literal: data.base64EncodedString())
    }
}

@main
struct PrivateObfuscationMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        Base64ObfuscationMacro.self,
    ]
}
