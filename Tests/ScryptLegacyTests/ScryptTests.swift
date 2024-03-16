import ScryptLegacy
import XCTest

final class ScryptLegacyTests: XCTestCase {
    let hello = Array("hello".utf8)

    func testScrypt() {
        XCTAssertEqual(
            (try! scrypt(password: hello, salt: hello, length: 48, N: 16384, r: 8, p: 1)).hex,
            "d66e389a849d0dc36a019586182b299ddb2572cf813d889f2fc074338d9c8a776d4e81630c1b9e1ca0fa44a01996e4d1"
        )
        XCTAssertEqual(
            (try! scrypt(password: hello, salt: hello, length: 48, N: 16384, r: 16, p: 1)).hex,
            "2db2f5a74eca2f8b5519c0d950640fe4ea126af69b2e49ad56df7263004b05a91a3f25a8c5da3e686c2f8b6b666f6da7"
        )
        XCTAssertEqual(
            (try! scrypt(password: hello, salt: hello, length: 48, N: 16384, r: 8, p: 4)).hex,
            "cde641fd4173c0d8609d4923f591c52a95d0d7e992b305dea7db666424326bfba8ff84d2cdb8fb6ed4082c9b9e4e31b9"
        )
        XCTAssertNotEqual(
            (try! scrypt(password: hello, salt: hello, length: 48, N: 8192, r: 8, p: 1)).hex,
            "d66e389a849d0dc36a019586182b299ddb2572cf813d889f2fc074338d9c8a776d4e81630c1b9e1ca0fa44a01996e4d1"
        )
    }

    func testApi() {
        XCTAssertThrowsError(try scrypt(password: [], salt: []))
        XCTAssertThrowsError(try scrypt(password: [], salt: hello))
        XCTAssertThrowsError(try scrypt(password: hello, salt: []))
        XCTAssertThrowsError(try scrypt(password: hello, salt: hello, length: 0))
        XCTAssertThrowsError(try scrypt(password: hello, salt: hello, length: 137_438_953_441))
        XCTAssertThrowsError(try scrypt(password: hello, salt: hello, N: 0))
        XCTAssertThrowsError(try scrypt(password: hello, salt: hello, N: 42))
        XCTAssertThrowsError(try scrypt(password: hello, salt: hello, r: 200_000, p: 10000))
        XCTAssertThrowsError(try scrypt(password: hello, salt: hello, r: 0, p: 0))
    }

    func testPerformance() {
        measure {
            _ = try! scrypt(password: hello, salt: hello, length: 32)
        }
    }
}

extension Sequence where Element == UInt8 {
    var hex: String { map { .init(format: "%02x", $0) }.joined() }
}
