//
//  Collection+Generator.swift
//  Generator
//

/// - TODO: Remove once Swift stops getting confused by `Collection.Generator`
public typealias Gen = Generator

extension Collection {
	/// - Returns: A new `Generator<Self>` starting at `self.startIndex`
	public func generator() -> Gen<Self> {
		return Gen(sequence: self)
	}
}
