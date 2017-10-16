//
//  Collection+Generator.swift
//  Generator
//

extension Collection {
	/// - Returns: A new `Gen<Self>` starting at `self.startIndex`
	public func generator() -> Gen<Self> {
		return Gen(sequence: self)
	}
}
