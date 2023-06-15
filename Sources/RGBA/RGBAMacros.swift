
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "RGBAMacro", type: "RGBAMacro")

@attached(conformance)
@attached(memberAttribute)
public macro RGBAShader() = #externalMacro(module: "RGBAMacro", type: "RGBAShader")
