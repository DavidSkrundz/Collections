// swift-tools-version:4.0
//
//  Package.swift
//  Collections
//

import PackageDescription

let package = Package(
	name: "Collections",
	products: [
		.library(
			name: "Generator",
			type: .static,
			targets: ["Generator"]),
		.library(
			name: "Generator",
			type: .dynamic,
			targets: ["Generator"])
	],
	targets: [
		.target(
			name: "Generator",
			dependencies: []),
		.testTarget(
			name: "GeneratorTests",
			dependencies: ["Generator"])
	]
)
