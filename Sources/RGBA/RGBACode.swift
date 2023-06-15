import OrderedCollections

public enum RGBACode {
    case variable(name: String, value: RGBAValue)
    indirect case combine(operator: RGBAOperator, lhs: RGBACode, rhs: RGBACode)
}

extension RGBACode {
    public var reference: String {
        switch self {
        case let .variable(name, _):
            return name
        case let .combine(`operator`, lhs, rhs):
            return "\(lhs.reference) \(`operator`.rawValue) \(rhs.reference)"
        }
    }
    public var block: String {
        var block = ""
        for (name, value) in variables {
            block += "\(value.type.rawValue) \(name) = \(value.raw);\n"
        }
        block += "return \(reference);"
        return block
    }
}

extension RGBACode {
    var variables: OrderedDictionary<String, RGBAValue> {
        var variables: OrderedDictionary<String, RGBAValue> = [:]
        switch self {
        case .variable(let name, let value):
            variables[name] = value
        case .combine(_, let lhs, let rhs):
            for (name, value) in lhs.variables {
                variables[name] = value
            }
            for (name, value) in rhs.variables {
                variables[name] = value
            }
        }
        return variables
    }
}

extension RGBACode {
    public static func + (lhs: Self, rhs: Self) -> Self {
        .combine(operator: .addition, lhs: lhs, rhs: rhs)
    }
}
