//
//  Generator+Move.swift
//  Generator
//

extension Gen {
	/// Advance the index by `amount`
	public mutating func advanceBy(_ amount: IndexDistance) {
		let end = self.collection.endIndex
		self.currentIndex = self.collection.index(self.currentIndex,
		                                          offsetBy: amount,
		                                          limitedBy: end) ?? end
	}

	/// Reverse the index by `amount`
	public mutating func reverseBy(_ amount: IndexDistance) {
		let start = self.collection.startIndex
		self.currentIndex = self.collection.index(self.currentIndex,
		                                          offsetBy: -amount,
		                                          limitedBy: start) ?? start
	}

	/// Moves the `Generator` index forward by one. Will never go past
	/// `EndIndex`
	public mutating func advance() {
		self.advanceBy(1)
	}

	/// Moves the `Generator` index backward by one. Will never go past
	/// `StartIndex`
	public mutating func reverse() {
		self.reverseBy(1)
	}
}
