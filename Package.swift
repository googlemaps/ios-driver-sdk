// swift-tools-version: 5.7
//
// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleRidesharingDriver", platforms: [.iOS(.v16)],
  products: [.library(name: "GoogleRidesharingDriver", targets: ["GoogleRidesharingDriverTarget"])],
  dependencies: [
    .package(url: "https://github.com/googlemaps/ios-navigation-sdk", from: "10.10.0")
  ],
  targets: [
    .binaryTarget(
      name: "GoogleRidesharingDriver",
      url:
        "https://dl.google.com/geosdk/swiftpm/10.10.1/GoogleRidesharingDriver_3p.xcframework.zip",
      checksum: "f67143e916a68f0e0f861ad5f5603f0fc9a0e91582bf6ba04e91e6ca980d4b72"
    ),
    .target(
      name: "GoogleRidesharingDriverTarget",
      dependencies: [
        "GoogleRidesharingDriver",
        .product(name: "GoogleNavigation", package: "ios-navigation-sdk"),
      ],
      path: "Driver",
      sources: ["GMTDEmpty.m"],
      resources: [.copy("Resources/GoogleRidesharingDriver/GoogleRidesharingDriver.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("c++"),
        .linkedLibrary("z"),
        .linkedFramework("Accelerate"),
        .linkedFramework("AVFoundation"),
        .linkedFramework("AudioToolbox"),
        .linkedFramework("CoreData"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreImage"),
        .linkedFramework("CoreLocation"),
        .linkedFramework("CoreText"),
        .linkedFramework("GLKit"),
        .linkedFramework("ImageIO"),
        .linkedFramework("OpenGLES"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("LocalAuthentication"),
      ]
    ),
  ]
)
