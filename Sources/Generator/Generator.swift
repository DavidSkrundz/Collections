//
//  Generator.swift
//  Generator
//

/// A `Generator` behaves like an `Iterator`, but allows for backtracking and
/// skipping elements
///
/// - Author: David Skrundz
public struct Generator<Container: Collection> {
	public typealias Index = Container.Index
	
	internal let collection: Container
	internal var currentIndex: Index
	
	/// - Retutns: `true` iff `self.reverse()` would have no effect
	public var atStart: Bool {
		return self.currentIndex == self.collection.startIndex
	}
	
	/// - Returns: `true` iff `self.advance()` would have no effect
	public var atEnd: Bool {
		return self.currentIndex == self.collection.endIndex
	}
	
	/// - Returns: `true` iff `self.peek()` and `self.next()` would return
	///            non-`nil`
	public var hasNext: Bool {
		return !self.atEnd
	}
	
	/// Create a new `Generator` starting at `sequence.startIndex`
	public init(sequence: Container) {
		self.collection = sequence
		self.currentIndex = self.collection.startIndex
	}
	
	/// Get the remaining items
	///
	/// - Note: Does not advance the index
	///
	/// - Returns: A `Container.SubSequence` of remaining items
	public func remaining() -> Container.SubSequence {
		let startIndex = self.currentIndex
		let endIndex = self.collection.endIndex
		return self.collection[startIndex..<endIndex]
	}
}
