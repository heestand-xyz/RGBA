import XCTest
@testable import RGBA

@RGBAShader
struct TestShader {
    
    var a = 1.0
    var b = 2.0
    
    var code: RGBACode {
        $a + $b + 3.0
    }
}

final class RGBATests: XCTestCase {
    
    func testAdd() throws {
        let shader: RGBAProtocol = TestShader()
        XCTAssertEqual(
            shader.code.text,
            """
            float a = 1.0;
            float b = 2.0;
            return a + b + 3.0;
            """
        )
    }
}

