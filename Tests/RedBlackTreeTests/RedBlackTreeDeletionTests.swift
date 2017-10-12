//
//  RedBlackTreeDeletionTests.swift
//  Collections
//

import XCTest
@testable import RedBlackTree

class RedBlackTreeDeletionTests: XCTestCase {
	private var tree: RedBlackTree<Int, Void>!
	
	override func setUp() {
		tree = RedBlackTree()
		tree.insert(4, ())
		tree.insert(2, ())
		tree.insert(6, ())
		tree.insert(1, ())
		tree.insert(3, ())
		tree.insert(5, ())
		tree.insert(7, ())
	}
	
	func testDeleteRoot() {
		tree.delete(key: 4)
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(3, .black),
				.Node(
					RedBlackTreeNodeInformation(2, .black),
					.Node(
						RedBlackTreeNodeInformation(1, .red),
						.Null,
						.Null
					),
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(6, .black),
					.Node(
						RedBlackTreeNodeInformation(5, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(7, .red),
						.Null,
						.Null
					)
				)
			)
		)
	}
	
	func testDeleteLeftLeaf() {
		tree.delete(key: 5)
		
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
					RedBlackTreeNodeInformation(6, .black),
					.Null,
					.Node(
						RedBlackTreeNodeInformation(7, .red),
						.Null,
						.Null
					)
				)
			)
		)
	}
	
	func testDeleteRightLeaf() {
		tree.delete(key: 7)
		
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
					RedBlackTreeNodeInformation(6, .black),
					.Node(
						RedBlackTreeNodeInformation(5, .red),
						.Null,
						.Null
					),
					.Null
				)
			)
		)
	}
	
	func testDeleteLeftMiddleNode() {
		tree.delete(key: 2)
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(4, .black),
				.Node(
					RedBlackTreeNodeInformation(1, .black),
					.Null,
					.Node(
						RedBlackTreeNodeInformation(3, .red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(6, .black),
					.Node(
						RedBlackTreeNodeInformation(5, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(7, .red),
						.Null,
						.Null
					)
				)
			)
		)
	}
	
	func testDeleteRightMiddleNode() {
		tree.delete(key: 6)
		
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
					.Node(
						RedBlackTreeNodeInformation(7, .red),
						.Null,
						.Null
					)
				)
			)
		)
	}
	
	static var allTests = [
		("testDeleteRoot", testDeleteRoot),
		("testDeleteLeftLeaf", testDeleteLeftLeaf),
		("testDeleteRightLeaf", testDeleteRightLeaf),
		("testDeleteLeftMiddleNode", testDeleteLeftMiddleNode),
		("testDeleteRightMiddleNode", testDeleteRightMiddleNode)
	]
}
