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
                "libscrypt/crypto_scrypt-nosse.c",
                "libscrypt/sha256.c",
                "libscrypt/slowequals.c",
            ]
        ),
        .testTarget(name: "ScryptLegacyTests", dependencies: ["ScryptLegacy"]),
    ]
)
