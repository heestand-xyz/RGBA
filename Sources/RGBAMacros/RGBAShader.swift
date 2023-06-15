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
        
//        let allVariableNames: [String] = declaration.memberBlock.members.compactMap({ $0.decl.as(VariableDeclSyntax.self)?.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text })
        
        if let variableName = member.as(VariableDeclSyntax.self)?.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text {
            
//            let isRoot: Bool = allVariableNames.contains(variableName)
            
            if variableName == "code" { return [] }
            return [.init(stringLiteral: "@RGBAVariable(\"\(variableName)\")")]
        }
        
        return []
    }
}
