public enum RGBAOperator: String {
    case add = "+"
    case multiply = "*"
}

// MARK: Add

extension RGBACode {
    
    public static func + (lhs: Self, rhs: Self) -> RGBADynamicCode {
        .combine(operator: .add, lhs: lhs, rhs: rhs)
    }
}


extension RGBACode {
    
    public static func + (lhs: Self, rhs: RGBADynamicCode) -> RGBADynamicCode {
        .combine(operator: .add, lhs: lhs, rhs: rhs)
    }
}


extension RGBACode {
    
    public static func + (lhs: RGBADynamicCode, rhs: Self) -> RGBADynamicCode {
        .combine(operator: .add, lhs: lhs, rhs: rhs)
    }
}


extension RGBADynamicCode {
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        .combine(operator: .add, lhs: lhs, rhs: rhs)
    }
}

// MARK: Multiply

extension RGBACode {
    
    public static func * (lhs: Self, rhs: Self) -> RGBADynamicCode {
        .combine(operator: .multiply, lhs: lhs, rhs: rhs)
    }
}


extension RGBACode {
    
    public static func * (lhs: Self, rhs: RGBADynamicCode) -> RGBADynamicCode {
        .combine(operator: .multiply, lhs: lhs, rhs: rhs)
    }
}


extension RGBACode {
    
    public static func * (lhs: RGBADynamicCode, rhs: Self) -> RGBADynamicCode {
        .combine(operator: .multiply, lhs: lhs, rhs: rhs)
    }
}


extension RGBADynamicCode {
    
    public static func * (lhs: Self, rhs: Self) -> Self {
        .combine(operator: .multiply, lhs: lhs, rhs: rhs)
    }
}
