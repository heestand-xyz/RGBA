import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct RGBAMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        RGBAMacro.self,
        RGBAShader.self,
    ]
}
