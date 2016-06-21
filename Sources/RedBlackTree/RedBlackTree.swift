//
//  RedBlackTree.swift
//  Collections
//

/// A Red-Black Tree
///
/// - Author: David Skrundz
public class RedBlackTree<Key: Comparable, Value> {
	var root: RedBlackTreeNode<Key, Value>?
	
	public init() {}
}

extension RedBlackTree: CustomStringConvertible {
	public var description: String {
		return self.root?.description ?? "[null]"
	}
}