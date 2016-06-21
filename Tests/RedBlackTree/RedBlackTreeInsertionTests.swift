//
//  RedBlackInsertionTreeTests.swift
//  Collections
//

@testable import RedBlackTree
import XCTest

class RedBlackInsertionTreeTests: XCTestCase {
	private var tree: RedBlackTree<Int, Void>!
	
	override func setUp() {
		tree = RedBlackTree<Int, Void>()
	}
	
	func testInsertionIntoEmptyTree() {
		tree.insert(1, ())
		
		XCTAssertEqual(tree.root!.representation,
			RedBlackTreeRepresentation.Node(
				RedBlackTreeNodeInformation(1, .Black),
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
				RedBlackTreeNodeInformation(1, .Black),
				.Node(
					RedBlackTreeNodeInformation(0, .Red),
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
				RedBlackTreeNodeInformation(1, .Black),
				.Null,
				.Node(
					RedBlackTreeNodeInformation(2, .Red),
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
				RedBlackTreeNodeInformation(2, .Black),
				.Node(
					RedBlackTreeNodeInformation(1, .Black),
					.Null,
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(4, .Black),
					.Node(
						RedBlackTreeNodeInformation(3, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(5, .Red),
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
				RedBlackTreeNodeInformation(5, .Black),
				.Node(
					RedBlackTreeNodeInformation(3, .Black),
					.Node(
						RedBlackTreeNodeInformation(1, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(4, .Red),
						.Null,
						.Null
					)
				),
				.Node(
					RedBlackTreeNodeInformation(10, .Black),
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
				RedBlackTreeNodeInformation(5, .Black),
				.Node(
					RedBlackTreeNodeInformation(1, .Black),
					.Null,
					.Null
				),
				.Node(
					RedBlackTreeNodeInformation(7, .Black),
					.Node(
						RedBlackTreeNodeInformation(6, .Red),
						.Null,
						.Null
					),
					.Node(
						RedBlackTreeNodeInformation(10, .Red),
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
		("testInsertionToTheRightOfRootLeftLeaning", testInsertionToTheRightOfRootLeftLeaning),
	]
}