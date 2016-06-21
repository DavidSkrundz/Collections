//
//  RedBlackTreeNode+Rotation.swift
//  Collections
//

extension RedBlackTreeNode {
	/// Rotates `self` to the left.
	///
	/// Results in `self` becoming the `leftChild` of its former `rightChild`
	///
	/// - Note: Drops reference to any parent of `self`.  The root of the tree should be stored externally
	///
	/// - Returns: The new root of the tree
	internal func rotateLeft() -> RedBlackTreeNode {
		let savedParent = self.rightChild // keep a reference to avoid deallocation
		
		self.rightChild?.parent = self.parent
		if self.parent?.leftChild === self {
			self.parent?.leftChild = savedParent
		} else {
			self.parent?.rightChild = savedParent
		}
		
		self.parent = savedParent
		
		self.rightChild = savedParent?.leftChild
		self.rightChild?.parent = self
		savedParent?.leftChild = self
		
		var rootNode = self
		while let newRoot = rootNode.parent {
			rootNode = newRoot
		}
		return rootNode
	}
	
	/// Rotates `self` to the right.
	///
	/// Results in `self` becoming the `rightChild` of its former `leftChild`
	///
	/// - Note: Drops reference to any parent of `self`.  The root of the tree should be stored externally
	///
	/// - Returns: The new root of the tree
	internal func rotateRight() -> RedBlackTreeNode {
		let savedParent = self.leftChild // keep a reference to avoid deallocation
		
		self.leftChild?.parent = self.parent
		if self.parent?.leftChild === self {
			self.parent?.leftChild = savedParent
		} else {
			self.parent?.rightChild = savedParent
		}
		
		self.parent = savedParent
		
		self.leftChild = savedParent?.rightChild
		self.leftChild?.parent = self
		savedParent?.rightChild = self
		
		var rootNode = self
		while let newRoot = rootNode.parent {
			rootNode = newRoot
		}
		return rootNode
	}
}