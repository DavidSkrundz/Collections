//
//  Pair.swift
//  Pair
//

public func pair<Sequence1, Sequence2>
	(_ sequence1: Sequence1,
	 _ sequence2: Sequence2) -> Pair2Sequence<Sequence1, Sequence2>
	where Sequence1: Sequence, Sequence2: Sequence {
		return Pair2Sequence(sequence1: sequence1, sequence2: sequence2)
}
