import CoreGraphics

public protocol RGBAValue {
    var code: String { get }
}

extension Double: RGBAValue {
    public var code: String { "\(self)" }
}

extension CGFloat: RGBAValue {
    public var code: String { "\(self)" }
}
