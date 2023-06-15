
@propertyWrapper
public struct RGBAVariable<T: RGBAValue> {
    
    let name: String
    
    public var wrappedValue: T
    
    public var projectedValue: RGBADynamicCode {
        .variable(name: name, value: wrappedValue)
    }
    
    public init(wrappedValue: T, name: String) {
        self.wrappedValue = wrappedValue
        self.name = name
    }
}
