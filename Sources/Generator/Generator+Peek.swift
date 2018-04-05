//
//  Generator+Peek.swift
//  Generator
//

extension Generator {
	/// Get the next element without advancing the index
	///
	/// - Returns: The next element in the `Sequence`
	public func peek() -> Element? {
		guard self.hasNext else { return nil }
		return self.collection[self.currentIndex]
	}
	
	/// Get the next `amount` of elements and advance the index by `amount`
	///
	/// - Returns: A `SubSequence` of the next `amount` of elements or less if
	///            less exist
	public mutating func next(_ amount: Int) -> [Element] {
		let startIndex = self.currentIndex
		let end = self.collection.endIndex
		let endIndex = self.collection.index(self.currentIndex,
											 offsetBy: amount,
											 limitedBy: end) ?? end
		self.currentIndex = endIndex
		return Array(self.collection[startIndex..<endIndex])
	}
	
	/// Get the next `amount` of elements without advancing the index by
	/// `amount`
	///
	/// - Returns: A `SubSequence` of the next `amount` of elements or less if
	///            less exist
	public func peek(_ amount: Int) -> [Element] {
		let startIndex = self.currentIndex
		let end = self.collection.endIndex
		let endIndex = self.collection.index(self.currentIndex,
											 offsetBy: amount,
											 limitedBy: end) ?? end
		return Array(self.collection[startIndex..<endIndex])
	}
}
