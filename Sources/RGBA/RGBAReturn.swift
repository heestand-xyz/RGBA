
public struct RGBAReturn<T: RGBAValue>: RGBACode {
        
    let name: String
    let value: T
    
    public var text: String {
        "\(name)(\(value.text))"
    }
    
    public init(_ value: T, name: String) {
        self.name = name
        self.value = value
    }
}
