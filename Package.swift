// swift-tools-version:4.2
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
			targets: ["Generator"]),
		.library(
			name: "sGenerator",
			type: .static,
			targets: ["Generator"]),
		.library(
			name: "dGenerator",
			type: .dynamic,
			targets: ["Generator"]),
		.library(
			name: "Graph",
			targets: ["Graph"]),
		.library(
			name: "sGraph",
			type: .static,
			targets: ["Graph"]),
		.library(
			name: "dGraph",
			type: .dynamic,
			targets: ["Graph"]),
		.library(
			name: "Pair",
			targets: ["Pair"]),
		.library(
			name: "sPair",
			type: .static,
			targets: ["Pair"]),
		.library(
			name: "dPair",
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
			name: "Graph",
			dependencies: []),
		.testTarget(
			name: "GraphTests",
			dependencies: ["Graph"]),
		.target(
			name: "Pair",
			dependencies: []),
		.testTarget(
			name: "PairTests",
			dependencies: ["Pair"])
	]
)
