import OrderedCollections

public enum RGBADynamicCode: RGBACode {
    
    case variable(name: String, value: RGBAValue)
    
    indirect case combine(operator: RGBAOperator, lhs: RGBACode, rhs: RGBACode)
}

extension RGBADynamicCode {
    
    private var reference: String {
        switch self {
        case let .variable(name, _):
            return name
        case let .combine(`operator`, lhs, rhs):
            let leading: String = (lhs as? RGBADynamicCode)?.reference ?? lhs.text
            let trailing: String = (rhs as? RGBADynamicCode)?.reference ?? rhs.text
            return "\(leading) \(`operator`.rawValue) \(trailing)"
        }
    }
    
    public var text: String {
        var shader = ""
        for (name, value) in variables {
            shader += "\(value.type.rawValue) \(name) = \(value.text);\n"
        }
        shader += "return \(reference);"
        return shader
    }
}

extension RGBADynamicCode {
    
    var variables: OrderedDictionary<String, RGBAValue> {
        var variables: OrderedDictionary<String, RGBAValue> = [:]
        switch self {
        case .variable(let name, let value):
            variables[name] = value
        case .combine(_, let lhs, let rhs):
            if let dynamicCode = lhs as? RGBADynamicCode {
                for (name, value) in dynamicCode.variables {
                    variables[name] = value
                }
            }
            if let dynamicCode = rhs as? RGBADynamicCode {
                for (name, value) in dynamicCode.variables {
                    variables[name] = value
                }
            }
        }
        return variables
    }
}
