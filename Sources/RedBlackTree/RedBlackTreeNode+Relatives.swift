//
//  RedBlackTreeNode+Relatives.swift
//  Collections
//

extension RedBlackTreeNode {
	/// - Returns: The grandparent of `self`
	internal var grandparent: RedBlackTreeNode? {
		return self.parent?.parent
	}
	
	/// - Returns: The sibling of `self.parent`
	internal var uncle: RedBlackTreeNode? {
		if self.parent?.parent?.leftChild === self.parent {
			return self.parent?.parent?.rightChild
		}
		return self.parent?.parent?.leftChild
	}
	
	/// - Returns: The sibling of `self`
	internal var sibling: RedBlackTreeNode? {
		if self.parent?.leftChild === self {
			return self.parent?.rightChild
		}
		return self.parent?.leftChild
	}
	
	/// - Returns: `true` iff `self === self.parent?.rightChild`
	internal var isRightChild: Bool {
		return self === self.parent?.rightChild
	}
	
	/// - Returns: `true` iff `self === self.parent?.leftChild`
	internal var isLeftChild: Bool {
		return self === self.parent?.leftChild
	}
}