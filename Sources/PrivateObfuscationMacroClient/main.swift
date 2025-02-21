import PrivateObfuscationMacro
import Foundation

let result = #arrayEncoded("test")

//let base64Decoded = String(data: Data(base64Encoded: result)!, encoding: .utf8)

print(result)
