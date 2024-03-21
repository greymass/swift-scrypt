import XCTest

import ScryptLegacyTests

var tests = [XCTestCaseEntry]()
tests += ScryptTests.__allTests()

XCTMain(tests)
