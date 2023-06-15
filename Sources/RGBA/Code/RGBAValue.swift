import CoreGraphics

public protocol RGBAValue: RGBACode {
    var type: RGBAType { get }
}

extension Float: RGBAValue {
    public var type: RGBAType { .float }
    public var text: String { "\(self)" }
}

extension Double: RGBAValue {
    public var type: RGBAType { .float }
    public var text: String { "\(self)" }
}

extension CGFloat: RGBAValue {
    public var type: RGBAType { .float }
    public var text: String { "\(self)" }
}
