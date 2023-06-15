import RGBAMacros

@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "RGBAMacros", type: "RGBAMacro")

@attached(conformance)
@attached(memberAttribute)
public macro RGBAShader() = #externalMacro(module: "RGBAMacros", type: "RGBAShader")
