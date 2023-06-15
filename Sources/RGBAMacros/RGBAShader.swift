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

//        return [.init(stringLiteral: "\(member.debugDescription)")]
        
//        let allVariableNames: [String] = declaration.memberBlock.members.compactMap({ $0.decl.as(VariableDeclSyntax.self)?.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text })

        if let variableName: String = member.as(VariableDeclSyntax.self)?.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text {
            
            //            let isRoot: Bool = allVariableNames.contains(variableName)
            
            if variableName == "code" {
                return []
            }
            
            return [.init(stringLiteral: "@RGBAVariable(name: \"\(variableName)\")")]
            
        } else if let functionName = member.as(FunctionDeclSyntax.self)?.identifier.text {
            
            return [] // [.init(stringLiteral: "@RGBAFunction(\"\(functionName)\")")]
        }
        
        return []
    }
}

//FunctionDeclSyntax
//├─funcKeyword: keyword(SwiftSyntax.Keyword.func)
//├─identifier: identifier(" xyz")
//├─signature: FunctionSignatureSyntax
//│ ├─input: ParameterClauseSyntax
//│ │ ├─leftParen: leftParen
//│ │ ├─parameterList: FunctionParameterListSyntax
//│ │ │ ├─[0]: FunctionParameterSyntax
//│ │ │ │ ├─firstName: identifier(" x")
//│ │ │ │ ├─colon: colon
//│ │ │ │ ├─type: SimpleTypeIdentifierSyntax
//│ │ │ │ │ ╰─name: identifier(" CGFloat")
//│ │ │ │ ╰─trailingComma: comma
//│ │ │ ╰─[1]: FunctionParameterSyntax
//│ │ │   ├─firstName: identifier(" y")
//│ │ │   ├─colon: colon
//│ │ │   ╰─type: SimpleTypeIdentifierSyntax
//│ │ │     ╰─name: identifier(" CGFloat")
//│ │ ╰─rightParen: rightParen
//│ ╰─output: ReturnClauseSyntax
//│   ├─arrow: arrow
//│   ╰─returnType: SimpleTypeIdentifierSyntax
//│     ╰─name: identifier(" CGFloat")
//╰─body: CodeBlockSyntax
//  ├─leftBrace: leftBrace
//  ├─statements: CodeBlockItemListSyntax
//  │ ╰─[0]: CodeBlockItemSyntax
//  │   ╰─item: SequenceExprSyntax
//  │     ╰─elements: ExprListSyntax
//  │       ├─[0]: IdentifierExprSyntax
//  │       │ ╰─identifier: identifier(" x")
//  │       ├─[1]: BinaryOperatorExprSyntax
//  │       │ ╰─operatorToken: binaryOperator(" *")
//  │       ╰─[2]: IdentifierExprSyntax
//  │         ╰─identifier: identifier(" y")
//  ╰─rightBrace: rightBrace
