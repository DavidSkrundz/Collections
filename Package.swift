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
			name: "RedBlackTree",
			type: .static,
			targets: ["RedBlackTree"]),
		.library(
			name: "RedBlackTree",
			type: .dynamic,
			targets: ["RedBlackTree"])
	],
	targets: [
		.target(
			name: "RedBlackTree",
			dependencies: []),
		.testTarget(
			name: "RedBlackTreeTests",
			dependencies: ["RedBlackTree"])
	]
)
