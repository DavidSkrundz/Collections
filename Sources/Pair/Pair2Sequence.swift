//
//  Pair2Sequence.swift
//  Pair
//

public struct Pair2Sequence<Sequence1, Sequence2>: Sequence
		where Sequence1: Sequence, Sequence2: Sequence {
	public typealias Iterator = Pair2Iterator<Sequence1.Iterator, Sequence2.Iterator>
	
	private var sequence1: Sequence1
	private var sequence2: Sequence2
	
	internal init(sequence1: Sequence1, sequence2: Sequence2) {
		self.sequence1 = sequence1
		self.sequence2 = sequence2
	}
	
	public func makeIterator() -> Pair2Iterator<Sequence1.Iterator, Sequence2.Iterator> {
		return Pair2Iterator(iterator1: self.sequence1.makeIterator(),
							 iterator2: self.sequence2.makeIterator())
	}
}
