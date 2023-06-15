# RGBA

Write Metal in Swift

## Swift

Using the `@RGBAShader` macro.

```swift
@RGBAShader
struct DemoShader {
    
    var a = 1.0
    var b = 2.0
    
    var code: RGBACode {
        $a + $b
    }
}
```

## Metal

Auto generated code.

```metal
float a = 1.0;
float b = 2.0;
return a + b;
```
