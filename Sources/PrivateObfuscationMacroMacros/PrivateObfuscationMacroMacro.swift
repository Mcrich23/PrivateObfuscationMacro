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

@main
struct PrivateObfuscationMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ArrayJoinedObfuscationMacro.self,
    ]
}
