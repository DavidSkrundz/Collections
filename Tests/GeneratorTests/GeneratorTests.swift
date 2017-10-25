//
//  GeneratorTests.swift
//  Generator
//

import XCTest
import Generator

class GeneratorTests: XCTestCase {
	func testNext() {
		let testCollection = ["1", "2"]
		var generator = testCollection.generator()
		
		XCTAssertEqual(generator.next(), "1")
		XCTAssertEqual(generator.next(), "2")
		XCTAssertEqual(generator.next(), nil)
	}
	
	func testPeek() {
		let testCollection = ["1", "2"]
		var generator = testCollection.generator()
		
		XCTAssertEqual(generator.peek(), "1")
		XCTAssertEqual(generator.next(), "1")
		XCTAssertEqual(generator.peek(), "2")
		generator.advance()
		XCTAssertEqual(generator.peek(), nil)
	}
	
	func testPrevious() {
		let testCollection = ["1", "2"]
		var generator = testCollection.generator()
		
		XCTAssertEqual(generator.previous(), nil)
		generator.advance()
		XCTAssertEqual(generator.previous(), "1")
		XCTAssertEqual(generator.previous(), nil)
	}
	
	func testPeekPrevious() {
		let testCollection = ["1", "2"]
		var generator = testCollection.generator()
		
		XCTAssertEqual(generator.peekPrevious(), nil)
		generator.advance()
		XCTAssertEqual(generator.peekPrevious(), "1")
		XCTAssertEqual(generator.previous(), "1")
	}
	
	func testNextAmount() {
		let testCollection = ["1", "2", "3"]
		var generator = testCollection.generator()
		
		XCTAssertEqual(generator.next(1), ["1"])
		XCTAssertEqual(generator.next(4), ["2", "3"])
	}
	
	func testPeekAmount() {
		let testCollection = ["1", "2", "3"]
		let generator = testCollection.generator()
		
		XCTAssertEqual(generator.peek(1), ["1"])
		XCTAssertEqual(generator.peek(4), ["1", "2", "3"])
	}
	
	func testPreviousAmount() {
		let testCollection = ["1", "2", "3"]
		var generator = testCollection.generator()
		
		generator.advanceBy(3)
		XCTAssertEqual(generator.previous(2), ["3", "2"])
		generator.advanceBy(8)
		XCTAssertEqual(generator.previous(5), ["3", "2", "1"])
	}
	
	func testPeekPreviousAmount() {
		let testCollection = ["1", "2", "3"]
		var generator = testCollection.generator()
		
		generator.advanceBy(3)
		XCTAssertEqual(generator.peekPrevious(2), ["3", "2"])
		XCTAssertEqual(generator.peekPrevious(5), ["3", "2", "1"])
	}
	
	func testAdvanceBy() {
		let testCollection = ["1", "2", "3"]
		var generator = testCollection.generator()
		
		generator.advanceBy(2)
		XCTAssertEqual(generator.peek(), "3")
		generator.advanceBy(3)
		XCTAssertEqual(generator.peek(), nil)
	}
	
	func testReverseBy() {
		let testCollection = ["1", "2", "3"]
		var generator = testCollection.generator()
		
		generator.advanceBy(3)
		XCTAssertEqual(generator.peek(), nil)
		generator.reverseBy(2)
		XCTAssertEqual(generator.peek(), "2")
		generator.reverse()
		generator.reverse()
		generator.reverse()
		generator.reverse()
		generator.reverse()
		generator.reverse()
		XCTAssertEqual(generator.peek(), "1")
	}
	
	func testForLoop() {
		let testCollection = ["1","2","3","4","5","6","7","8","9"]
		let generator = testCollection.generator()
		
		var resultCollection = [String]()
		generator.forEach { element in
			resultCollection.append(element)
		}
		XCTAssertEqual(resultCollection, testCollection)
	}
	
	func testRemainingItems() {
		let testCollection = ["1","2","3","4","5","6","7","8","9"]
		var generator = testCollection.generator()
		
		generator.advanceBy(6)
		XCTAssertEqual(generator.remainingItems(), ["7", "8", "9"])
		XCTAssertEqual(generator.next(), "7")
	}
	
	func testStringWhitespaceSkip() {
		let string = "1234                890"
		var generator = string.generator()
		
		generator.advanceBy(6)
		generator.skipWhitespace()
		XCTAssertEqual(generator.next(), "8")
		XCTAssertEqual(generator.next(), "9")
	}
	
	static var allTests = [
		("testNext", testNext),
		("testPeek", testPeek),
		("testPrevious", testPrevious),
		("testPeekPrevious", testPeekPrevious),
		("testNextAmount", testNextAmount),
		("testPeekAmount", testPeekAmount),
		("testPreviousAmount", testPreviousAmount),
		("testPeekPreviousAmount", testPeekPreviousAmount),
		("testAdvanceBy", testAdvanceBy),
		("testReverseBy", testReverseBy),
		("testForLoop", testForLoop),
		("testRemainingItems", testRemainingItems),
		("testStringWhitespaceSkip", testStringWhitespaceSkip)
	]
}
