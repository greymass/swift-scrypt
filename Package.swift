// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "swift-scrypt-legacy",
    products: [
        .library(name: "ScryptLegacy", targets: ["ScryptLegacy"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "ScryptLegacy", dependencies: ["libscryptLegacy"]),
        .target(
            name: "libscryptLegacy",
            sources: [
                "libscryptLegacy/crypto_scrypt_legacy-nosse.c",
                "libscryptLegacy/sha256_legacy.c",
                "libscryptLegacy/slowequals_legacy.c",
            ]
        ),
        .testTarget(name: "ScryptLegacyTests", dependencies: ["ScryptLegacy"]),
    ]
)
