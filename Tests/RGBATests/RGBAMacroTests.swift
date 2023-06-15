//import SwiftSyntaxMacros
//import SwiftSyntaxMacrosTestSupport
//import XCTest
//import RGBAMacro
//import RGBA
//
//let testMacros: [String: Macro.Type] = [
//    "stringify": RGBAMacro.self,
//]
//
//final class MyMacroTests: XCTestCase {
//    
//    func testMacro() {
//        assertMacroExpansion(
//            """
//            #stringify(a + b)
//            """,
//            expandedSource: """
//            (a + b, "a + b")
//            """,
//            macros: testMacros
//        )
//    }
//
//    func testMacroWithStringLiteral() {
//        assertMacroExpansion(
//            #"""
//            #stringify("Hello, \(name)")
//            """#,
//            expandedSource: #"""
//            ("Hello, \(name)", #""Hello, \(name)""#)
//            """#,
//            macros: testMacros
//        )
//    }
//}
