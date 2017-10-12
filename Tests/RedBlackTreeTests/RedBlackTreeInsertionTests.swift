//
//  RedBlackTreeInsertionTests.swift
//  Collections
//

import XCTest
@testable import RedBlackTree

class RedBlackTreeInsertionTests: XCTestCase {
	private var tree: RedBlackTree<Int, Void>!
	
	override func setUp() {
		tree = RedBlackTree<Int, Void>()
	}
	
	func testInsertionIntoEmptyTree() {
		tree.insert(1, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .black),
				.Null,
				.Null
			)
		)
	}
	
	func testInsertionToTheLeftOfRootNoRotation() {
		tree.insert(1, ())
		tree.insert(0, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .black),
				.Node(
					RedBlackTreeNodeInformation(0, .red),
					.Null,
					.Null
				),
				.Null
			)
		)
	}
	
	func testInsertionToTheRightOfRootNoRotation() {
		tree.insert(1, ())
		tree.insert(2, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .black),
				.Null,
				.Node(
					RedBlackTreeNodeInformation(2, .red),
					.Null,
					.Null
				)
			)
		)
	}
	
	func testInsertionToTheLeftOfRootLeftLeaning() {
		tree.insert(5, ())
		tree.insert(4, ())
		tree.insert(3, ())
		tree.insert(2, ())
		tree.insert(1, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(4, .black),
				.Node(
					RedBlackTreeNodeInformation(2, .black),
					.Node(
						RedBlackTreeNodeInformation(1, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(3, .red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(5, .black),
					.Null,
					.Null
				)
			)
		)
	}
	
	func testInsertionToTheRightOfRootRightLeaning() {
		tree.insert(1, ())
		tree.insert(2, ())
		tree.insert(3, ())
		tree.insert(4, ())
		tree.insert(5, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(2, .black),
				.Node(
					RedBlackTreeNodeInformation(1, .black),
					.Null,
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(4, .black),
					.Node(
						RedBlackTreeNodeInformation(3, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(5, .red),
						.Null,
						.Null
					)
				)
			)
		)
	}
	
	func testInsertionToTheLeftOfRootRightLeaning() {
		tree.insert(10, ())
		tree.insert(1, ())
		tree.insert(5, ())
		tree.insert(3, ())
		tree.insert(4, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(5, .black),
				.Node(
					RedBlackTreeNodeInformation(3, .black),
					.Node(
						RedBlackTreeNodeInformation(1, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(4, .red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(10, .black),
					.Null,
					.Null
				)
			)
		)
	}
	
	func testInsertionToTheRightOfRootLeftLeaning() {
		tree.insert(1, ())
		tree.insert(10, ())
		tree.insert(5, ())
		tree.insert(7, ())
		tree.insert(6, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(5, .black),
				.Node(
					RedBlackTreeNodeInformation(1, .black),
					.Null,
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(7, .black),
					.Node(
						RedBlackTreeNodeInformation(6, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(10, .red),
						.Null,
						.Null
					)
				)
			)
		)
	}
	
	static var allTests = [
		("testInsertionIntoEmptyTree", testInsertionIntoEmptyTree),
		("testInsertionToTheLeftOfRootNoRotation", testInsertionToTheLeftOfRootNoRotation),
		("testInsertionToTheRightOfRootNoRotation", testInsertionToTheRightOfRootNoRotation),
		("testInsertionToTheLeftOfRootLeftLeaning", testInsertionToTheLeftOfRootLeftLeaning),
		("testInsertionToTheRightOfRootRightLeaning", testInsertionToTheRightOfRootRightLeaning),
		("testInsertionToTheLeftOfRootRightLeaning", testInsertionToTheLeftOfRootRightLeaning),
		("testInsertionToTheRightOfRootLeftLeaning", testInsertionToTheRightOfRootLeftLeaning)
	]
}
