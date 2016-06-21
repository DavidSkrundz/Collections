//
//  RedBlackTreeDeletionTests.swift
//  Collections
//

@testable import RedBlackTree
import XCTest

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
				RedBlackTreeNodeInformation(3, .Black),
				.Node(
					RedBlackTreeNodeInformation(2, .Black),
					.Node(
						RedBlackTreeNodeInformation(1, .Red),
						.Null,
						.Null
					),
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(6, .Black),
					.Node(
						RedBlackTreeNodeInformation(5, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(7, .Red),
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
				RedBlackTreeNodeInformation(4, .Black),
				.Node(
					RedBlackTreeNodeInformation(2, .Black),
					.Node(
						RedBlackTreeNodeInformation(1, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(3, .Red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(6, .Black),
					.Null,
					.Node(
						RedBlackTreeNodeInformation(7, .Red),
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
				RedBlackTreeNodeInformation(4, .Black),
				.Node(
					RedBlackTreeNodeInformation(2, .Black),
					.Node(
						RedBlackTreeNodeInformation(1, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(3, .Red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(6, .Black),
					.Node(
						RedBlackTreeNodeInformation(5, .Red),
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
				RedBlackTreeNodeInformation(4, .Black),
				.Node(
					RedBlackTreeNodeInformation(1, .Black),
					.Null,
					.Node(
						RedBlackTreeNodeInformation(3, .Red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(6, .Black),
					.Node(
						RedBlackTreeNodeInformation(5, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(7, .Red),
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
				RedBlackTreeNodeInformation(4, .Black),
				.Node(
					RedBlackTreeNodeInformation(2, .Black),
					.Node(
						RedBlackTreeNodeInformation(1, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(3, .Red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(5, .Black),
					.Null,
					.Node(
						RedBlackTreeNodeInformation(7, .Red),
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
		("testDeleteRightMiddleNode", testDeleteRightMiddleNode),
	]
}