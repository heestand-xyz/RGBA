import CoreGraphics

public protocol RGBAValue {
    var type: RGBAType { get }
    var raw: String { get }
}

extension Double: RGBAValue {
    public var type: RGBAType { .float }
    public var raw: String { "\(self)" }
}

extension CGFloat: RGBAValue {
    public var type: RGBAType { .float }
    public var raw: String { "\(self)" }
}
