import XCTest
@testable import RGBA

@RGBAShader
struct TestShader {
    
    var a = 1.0
    var b = 2.0
    
    var code: RGBACode {
        .code("x")
    }
}

final class RGBATests: XCTestCase {
    
    func testAdd() throws {
        XCTAssertEqual(TestShader().code.raw, "a + b")
        
//        let proxy: any Proxy = a + b
//        XCTAssertEqual(proxy.code, "1.0 + 2.0")
    }
}
