//
//  Generator+Iterator.swift
//  Generator
//

extension Generator: IteratorProtocol {
	public typealias Element = Container.Element
	
	/// Get the next element and advance the index
	///
	/// - Returns: The next element in the `Sequence`
	public mutating func next() -> Element? {
		guard self.hasNext else { return nil }
		defer {
			self.currentIndex = self.collection.index(after: self.currentIndex)
		}
		return self.collection[self.currentIndex]
	}
}
