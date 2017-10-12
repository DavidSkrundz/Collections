//
//  RedBlackTreeNodeRotationTests.swift
//  Collections
//

import XCTest
@testable import RedBlackTree

class RedBlackTreeNodeRotationTests: XCTestCase {
	private var rootNode: RedBlackTreeNode<Int, Void>!
	
	override func setUp() {
		rootNode = RedBlackTreeNode(1, ())
		let parent1 = RedBlackTreeNode(2, ())
		let parent2 = RedBlackTreeNode(3, ())
		let child1 = RedBlackTreeNode(4, ())
		let child2 = RedBlackTreeNode(5, ())
		let child3 = RedBlackTreeNode(6, ())
		let child4 = RedBlackTreeNode(7, ())
		
		rootNode.leftChild = parent1
		rootNode.rightChild = parent2
		parent1.parent = rootNode
		parent2.parent = rootNode
		
		parent1.leftChild = child1
		parent1.rightChild = child2
		child1.parent = parent1
		child2.parent = parent1
		
		parent2.leftChild = child3
		parent2.rightChild = child4
		child3.parent = parent2
		child4.parent = parent2
	}
	
	func testRootLeftRotation() {
		let newRoot = rootNode.rotateLeft()
		
		XCTAssertEqual(newRoot.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(3, .red),
				.Node(
					RedBlackTreeNodeInformation(1, .red),
					.Node(
						RedBlackTreeNodeInformation(2, .red),
						.Node(
							RedBlackTreeNodeInformation(4, .red),
							.Null,
							.Null
						),
						.Node(
							RedBlackTreeNodeInformation(5, .red),
							.Null,
							.Null
						)
					),
					.Node(
						RedBlackTreeNodeInformation(6, .red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(7, .red),
					.Null,
					.Null
				)
			)
		)
	}
	
	func testRootRightRotation() {
		let newRoot = rootNode!.rotateRight()
		
		XCTAssertEqual(newRoot.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(2, .red),
				.Node(
					RedBlackTreeNodeInformation(4, .red),
					.Null,
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(1, .red),
					.Node(
						RedBlackTreeNodeInformation(5, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(3, .red),
						.Node(
							RedBlackTreeNodeInformation(6, .red),
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
		)
	}
	
	func testNonRootLeftRotationOnRightSide() {
		let newRoot = rootNode.rightChild!.rotateLeft()
		
		XCTAssertEqual(newRoot.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .red),
				.Node(
					RedBlackTreeNodeInformation(2, .red),
					.Node(
						RedBlackTreeNodeInformation(4, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(5, .red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(7, .red),
					.Node(
						RedBlackTreeNodeInformation(3, .red),
						.Node(
							RedBlackTreeNodeInformation(6, .red),
							.Null,
							.Null
						),
						.Null
					),
					.Null
				)
			)
		)
	}
	
	func testNonRootLeftRotationOnLeftSide() {
		let newRoot = rootNode.leftChild!.rotateLeft()
		
		XCTAssertEqual(newRoot.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .red),
				.Node(
					RedBlackTreeNodeInformation(5, .red),
					.Node(
						RedBlackTreeNodeInformation(2, .red),
						.Node(
							RedBlackTreeNodeInformation(4, .red),
							.Null,
							.Null
						),
						.Null
					),
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(3, .red),
					.Node(
						RedBlackTreeNodeInformation(6, .red),
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
	
	func testNonRootRightRotationOnRightSide() {
		let newRoot = rootNode.rightChild!.rotateRight()
		
		XCTAssertEqual(newRoot.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .red),
				.Node(
					RedBlackTreeNodeInformation(2, .red),
					.Node(
						RedBlackTreeNodeInformation(4, .red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(5, .red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(6, .red),
					.Null,
					.Node(
						RedBlackTreeNodeInformation(3, .red),
						.Null,
						.Node(
							RedBlackTreeNodeInformation(7, .red),
							.Null,
							.Null
						)
					)
				)
			)
		)
	}
	
	func testNonRootRightRotationOnLeftSide() {
		let newRoot = rootNode.leftChild!.rotateRight()
		
		XCTAssertEqual(newRoot.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .red),
				.Node(
					RedBlackTreeNodeInformation(4, .red),
					.Null,
					.Node(
						RedBlackTreeNodeInformation(2, .red),
						.Null,
						.Node(
							RedBlackTreeNodeInformation(5, .red),
							.Null,
							.Null
						)
					)
				),
				.Node(
					RedBlackTreeNodeInformation(3, .red),
					.Node(
						RedBlackTreeNodeInformation(6, .red),
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
	
	static var allTests = [
		("testRootLeftRotation", testRootLeftRotation),
		("testRootRightRotation", testRootRightRotation),
		("testNonRootLeftRotationOnRightSide", testNonRootLeftRotationOnRightSide),
		("testNonRootLeftRotationOnLeftSide", testNonRootLeftRotationOnLeftSide),
		("testNonRootRightRotationOnRightSide", testNonRootRightRotationOnRightSide),
		("testNonRootRightRotationOnLeftSide", testNonRootRightRotationOnLeftSide)
	]
}
