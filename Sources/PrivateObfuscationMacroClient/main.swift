import PrivateObfuscationMacro
import Foundation

let result = #base64Encoded("test")

let base64Decoded = String(data: Data(base64Encoded: result)!, encoding: .utf8)

print(base64Decoded)
