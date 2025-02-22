import PrivateObfuscationMacro
import Foundation

let arrayResult = #arrayEncoded("test")
let base64Result = #base64Encoded("test")

print("arrayResult: \(arrayResult)")
print("base64Result: \(base64Result ?? "base64Result: nil")")
