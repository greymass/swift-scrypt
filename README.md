# swift-scrypt

Swift bindings for [libscrypt](https://github.com/technion/libscrypt)

## Install

In your `Package.swift`:

```swift
dependencies: [
    .package(name: "Scrypt", url: "https://github.com/greymass/swift-scrypt.git", from: "1.0.0"),
]
```

## Usage

```swift
import Scrypt

let password = Array("hunter1".utf8)
let salt = Array("mysalt".utf8)

let hash = try! scrypt(password: password, salt: salt, length: 10)

print(hash) // [28, 254, 41, 21, 206, 165, 250, 244, 16, 109]
```

### `scrypt(password:salt:length:N:r:p:)`

```swift
public func scrypt(password: [UInt8], salt: [UInt8], length: Int = 64,
                   N: UInt64 = 16384, r: UInt32 = 8, p: UInt32 = 1) throws -> [UInt8]
```

Compute scrypt hash for given parameters.

#### Parameters

| Name      | Description                          |
| --------- | ------------------------------------ |
| password  | The password bytes.                  |
| salt      | The salt bytes.                      |
| length    | Desired hash length.                 |
| N         | Difficulty, must be a power of two.  |
| r         | Sequential read size.                |
| p         | Number of parallelizable iterations. |

#### Returns

Password hash corresponding to given `length`.

#### Throws `ScryptError`

```swift
public enum ScryptError: Error
```

> All errors `scrypt` can throw.

#### `invalidLength`

```swift
case invalidLength
```

> Thrown if length isn't between 1 and (2^32 - 1) * 32.

#### `invalidParameters`

```swift
case invalidParameters
```

> Thrown if any of N, r, p are 0 or N isn't a power of two.

#### `emptyPassword`

```swift
case emptyPassword
```

> Thrown if the password given was empty.

#### `emptySalt`

```swift
case emptySalt
```

> Thrown if the salt given was empty.

#### `unknownError(code:)`

```swift
case unknownError(code: Int32)
```

> Thrown if libscrypt returns an unexpected response code.
