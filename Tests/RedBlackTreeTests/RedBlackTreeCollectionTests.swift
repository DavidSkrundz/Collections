//
//  RedBlackTreeCollectionTests.swift
//  Collections
//
//  Created by David Skrundz on 2016-06-21.
//
//

import XCTest
import RedBlackTree

class RedBlackTreeCollectionTests: XCTestCase {
	func testForEach() {
		let tree = RedBlackTree<Int, Int>()
		tree.insert(1, 1)
		tree.insert(2, 2)
		tree.insert(3, 3)
		tree.insert(4, 4)
		tree.insert(5, 5)
		tree.insert(6, 6)
		tree.insert(8, 8)
		tree.insert(9, 9)
		tree.insert(0, 0)
		
		var collection = [Int]()
		tree.forEach {
			collection.append($0)
		}
	}
	
	static var allTests = [
		("testForEach", testForEach)
	]
}
