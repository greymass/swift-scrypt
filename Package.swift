// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Scrypt",
    products: [
        .library(name: "Scrypt", targets: ["Scrypt"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Scrypt", dependencies: ["libscrypt"]),
        .target(
            name: "libscrypt",
            sources: [
                "libscrypt/crypto_scrypt-nosse.c",
                "libscrypt/sha256.c",
                "libscrypt/slowequals.c",
            ]
        ),
        .testTarget(name: "ScryptTests", dependencies: ["Scrypt"]),
    ]
)
