//
//  Generator.swift
//  Generator
//

/// A `Gen` behaves like an `Iterator`, but allows for backtracking and
/// skipping elements
///
/// - Note: Will be renamed to `Generator` once Swift decides that it can
///         finally remove the `Iterator` typealias
///
/// - Author: David Skrundz
public struct Gen<Container: Collection> {
	public typealias Index = Container.Index
	public typealias IndexDistance = Container.IndexDistance
	
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
	
	/// Get the remaining items as an `Array`
	///
	/// - Note: Does not advance the index
	///
	/// - Returns: An `Array` of the remaining items
	public func remainingItems() -> [Element] {
		let startIndex = self.currentIndex
		let endIndex = self.collection.endIndex
		return Array(self.collection[startIndex..<endIndex])
	}
}
