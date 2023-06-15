
@propertyWrapper
public struct RGBAVariable<T: RGBAValue> {
    
    let name: String
    
    public var wrappedValue: T
    
    public var projectedValue: RGBACode {
        .variable(name: name, value: wrappedValue)
    }
    
    public init(wrappedValue: T, _ name: String) {
        self.wrappedValue = wrappedValue
        self.name = name
    }
}
