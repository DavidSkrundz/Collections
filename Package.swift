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
			targets: ["Generator"]),
		.library(
			name: "Pair",
			type: .static,
			targets: ["Pair"]),
		.library(
			name: "Pair",
			type: .dynamic,
			targets: ["Pair"])
	],
	targets: [
		.target(
			name: "Generator",
			dependencies: []),
		.testTarget(
			name: "GeneratorTests",
			dependencies: ["Generator"]),
		.target(
			name: "Pair",
			dependencies: []),
		.testTarget(
			name: "PairTests",
			dependencies: ["Pair"])
	]
)
