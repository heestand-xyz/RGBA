
@propertyWrapper
public struct RGBAWrapper<T: RGBAValue> {
    
    public var wrappedValue: T
    
    public var projectedValue: RGBACode {
        .value(wrappedValue)
    }
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}
