# PrivateObfuscationMacro
Obfuscating strings can be hard. `PrivateObfuscationMacro` makes this easy by making your source code readable, and obfuscating at compile time.

## Usage

### Array Splitting
One way of obfuscation is with array splitting. Simply call `#arrayEncoded("foo")` and at compile time, it will split the string by character into an array, and then join it back together.

### Base64 Encoding
Another way of obfuscation is with base64 encoding. Simply call `#base64Encoded("foo")` and at compile time, it will create an base64 encded string and then call a decode function.
