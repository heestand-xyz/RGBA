import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct RGBAShader: MemberAttributeMacro, ConformanceMacro {
    
    public static func expansion<Declaration, Context>(
        of node: SwiftSyntax.AttributeSyntax,
        providingConformancesOf declaration: Declaration,
        in context: Context
    ) throws -> [(
        SwiftSyntax.TypeSyntax,
        SwiftSyntax.GenericWhereClauseSyntax?
    )] where Declaration : SwiftSyntax.DeclGroupSyntax, Context : SwiftSyntaxMacros.MacroExpansionContext {
        [(SwiftSyntax.TypeSyntax.init(stringLiteral: "RGBAProtocol"), nil)]
    }
   
    public static func expansion<Declaration, MemberDeclaration, Context>(
        of node: SwiftSyntax.AttributeSyntax,
        attachedTo declaration: Declaration,
        providingAttributesFor member: MemberDeclaration,
        in context: Context
    ) throws -> [SwiftSyntax.AttributeSyntax] where Declaration : SwiftSyntax.DeclGroupSyntax, MemberDeclaration : SwiftSyntax.DeclSyntaxProtocol, Context : SwiftSyntaxMacros.MacroExpansionContext {
        if let variable = member as? VariableDeclSyntax {
            return [.init(stringLiteral: "//XYZ:\(variable.description)")]
        }
        if let item = member as? SwiftSyntax.MemberDeclListItemSyntax {
            if item.decl.is(VariableDeclSyntax.self) {
                return [.init(stringLiteral: "//YES\(item.description)")]
            }
        }
        return [
            .init(stringLiteral: "//...")
        ]
//        return [
//            .init(stringLiteral: "@RGBAWrapper")
//        ]
    }
}
