
public enum RGBACode {
    case value(RGBAValue)
    case code(String)
}

extension RGBACode {
    public var raw: String {
        switch self {
        case .value(let value):
            return value.code
        case .code(let code):
            return code
        }
    }
}

extension RGBACode {
    public static func + (lhs: Self, rhs: Self) -> Self {
        .code("\(lhs.raw) + \(rhs.raw)")
    }
}
