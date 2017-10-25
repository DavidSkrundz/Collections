//
//  Pair2Iterator.swift
//  Pair
//

public struct Pair2Iterator<Iterator1, Iterator2> : IteratorProtocol where Iterator1 : IteratorProtocol, Iterator2 : IteratorProtocol {
	public typealias Element = (Iterator1.Element, Iterator2.Element)
	
	private var lastIterator1: Iterator1.Element?
	private var baseIterator2: Iterator2
	
	private var iterator1: Iterator1
	private var iterator2: Iterator2
	
	internal init(iterator1: Iterator1, iterator2: Iterator2) {
		self.iterator1 = iterator1
		self.iterator2 = iterator2
		
		self.lastIterator1 = self.iterator1.next()
		self.baseIterator2 = self.iterator2
	}
	
	public mutating func next() -> (Iterator1.Element, Iterator2.Element)? {
		guard let lhs = self.lastIterator1 else { return nil }
		
		if let rhs = self.iterator2.next() {
			return (lhs, rhs)
		}
		
		self.iterator2 = self.baseIterator2
		self.lastIterator1 = self.iterator1.next()
		return self.next()
	}
}
