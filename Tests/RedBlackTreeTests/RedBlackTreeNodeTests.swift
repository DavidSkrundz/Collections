//
//  RedBlackTreeNodeTests.swift
//  Collections
//

import XCTest
@testable import RedBlackTree

class RedBlackTreeNodeTests: XCTestCase {
	func testGrandparent() {
		let grandparent = RedBlackTreeNode(1, ())
		let parent = RedBlackTreeNode(2, ())
		let node = RedBlackTreeNode(3, ())
		
		node.parent = parent
		parent.parent = grandparent
		
		XCTAssertTrue(node.grandparent === grandparent)
	}
	
	func testUncle() {
		let grandparent = RedBlackTreeNode(1, ())
		let uncle = RedBlackTreeNode(2, ())
		let parent = RedBlackTreeNode(3, ())
		let node = RedBlackTreeNode(4, ())
		
		node.parent = parent
		parent.parent = grandparent
		uncle.parent = grandparent
		grandparent.leftChild = parent
		grandparent.rightChild = uncle
		
		XCTAssertTrue(node.uncle === uncle)
	}
	
	func testSibling() {
		let parent = RedBlackTreeNode(1, ())
		let child = RedBlackTreeNode(2, ())
		let sibling = RedBlackTreeNode(3, ())
		
		parent.leftChild = child
		parent.rightChild = sibling
		child.parent = parent
		sibling.parent = parent
		
		XCTAssertTrue(child.sibling === sibling)
	}
	
	static var allTests = [
		("testGrandparent", testGrandparent),
		("testUncle", testUncle),
		("testSibling", testSibling)
	]
}
