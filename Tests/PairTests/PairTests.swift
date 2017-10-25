//
//  PairTests.swift
//  Pair
//

import XCTest
import Pair

class PairTests: XCTestCase {
	func testBothEmptyPair() {
		let a = [Int]()
		let b = [Int]()
		let c = pair(a, b)
		XCTAssertEqual(c.map{$0}.count, 0)
	}
	
	func testOneEmptyPair() {
		let a = [Int]()
		let b = [1, 2, 3]
		let c = pair(a, b)
		XCTAssertEqual(c.map{$0}.count, 0)
	}
	
	func testPair() {
		let a = [1, 2, 3]
		let b = [1, 2, 3]
		let c = pair(a, b)
		let pairs = [
			(1,1), (1,2), (1,3),
			(2,1), (2,2), (2,3),
			(3,1), (3,2), (3,3)
		]
		AssertEqual(c.map{$0}, pairs)
	}
	
	static var allTests = [
		("testBothEmptyPair", testBothEmptyPair),
		("testOneEmptyPair", testOneEmptyPair),
		("testPair", testPair)
	]
}

private func AssertEqual(_ lhs: [(Int, Int)],
                         _ rhs: [(Int, Int)],
                         _ message: @autoclosure () -> String = "",
                         file: StaticString = #file,
                         line: UInt = #line) {
	XCTAssertEqual(lhs.count, rhs.count, message, file: file, line: line)
	zip(lhs, rhs).forEach { (l, r) in
		XCTAssertEqual(l.0, r.0, message, file: file, line: line)
		XCTAssertEqual(l.1, r.1, message, file: file, line: line)
	}
}
