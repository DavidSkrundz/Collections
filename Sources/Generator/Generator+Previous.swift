//
//  Generator+Previous.swift
//  Generator
//

extension Gen {
	/// Get the previous element and reverse the index
	///
	/// - Returns: The previous element in the `Sequence`
	public mutating func previous() -> Element? {
		guard !self.atStart else { return nil }
		self.currentIndex = self.collection.index(self.currentIndex, offsetBy: -1)
		return self.collection[self.currentIndex]
	}
	
	/// Get the previous element without reversing the index
	///
	/// - Returns: The previous element in the `Sequence`
	public func peekPrevious() -> Element? {
		guard !self.atStart else { return nil }
		let previousIndex = self.collection.index(self.currentIndex, offsetBy: -1)
		return self.collection[previousIndex]
	}
	
	/// Get the previous `amount` of elements and reverse the index by `amount`
	///
	/// - Returns: A `SubSequence` of the previous `amount` of elements or less
	///            if less exist
	public mutating func previous(_ amount: IndexDistance) -> [Element] {
		let start = self.collection.startIndex
		let endIndex = self.currentIndex
		let startIndex = self.collection.index(self.currentIndex,
		                                       offsetBy: -amount,
		                                       limitedBy: start) ?? start
		self.currentIndex = startIndex
		return self.collection[self.currentIndex..<endIndex].reversed()
	}
	
	/// Get the previous `amount` of elements without reversing the index by
	/// `amount`
	///
	/// - Returns: A `SubSequence` of the previous `amount` of elements or less
	///            if less exist
	public func peekPrevious(_ amount: IndexDistance) -> [Element] {
		let start = self.collection.startIndex
		let startIndex = self.collection.index(self.currentIndex,
		                                       offsetBy: -amount,
		                                       limitedBy: start) ?? start
		let endIndex = self.currentIndex
		return self.collection[startIndex..<endIndex].reversed()
	}
}
