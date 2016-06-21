//
//  RedBlackTreeNode.swift
//  Collections
//

/// A node in a `RedBlackTree`
internal class RedBlackTreeNode<Key: Comparable, Value> {
	internal var color = RedBlackTreeNodeColor.Red
	
	private(set) internal var key: Key
	private(set) internal var value: Value
	
	internal weak var parent: RedBlackTreeNode?
	internal var leftChild: RedBlackTreeNode?
	internal var rightChild: RedBlackTreeNode?
	
	internal init(_ key: Key, _ value: Value) {
		self.key = key
		self.value = value
	}
	
	/// Insert the `node` as a child of `self` or of self's children.
	/// If `self.key == node.key` is `true`, no action is taken
	///
	/// - Note: Does not rebalance the tree.
	internal func insert(_ node: RedBlackTreeNode) {
		if node.key < self.key {
			if let leftChild = self.leftChild {
				leftChild.insert(node)
			} else {
				self.leftChild = node
				node.parent = self
			}
		}
		if node.key > self.key {
			if let rightChild = self.rightChild {
				rightChild.insert(node)
			} else {
				self.rightChild = node
				node.parent = self
			}
		}
	}
	
	/// If the node has 2 children, copy from its predecessor and return it
	///
	/// - Note: Does not rebalance the tree.
	///
	/// - Returns: The node with <2 children that should be deleted
	internal func delete(_ key: Key) -> RedBlackTreeNode? {
		if self.key > key {
			return self.leftChild?.delete(key)
		} else if self.key < key {
			return self.rightChild?.delete(key)
		} else {
			if self.leftChild != nil && self.rightChild != nil {
				var successor = self.leftChild!
				while successor.rightChild != nil {
					successor = successor.rightChild!
				}
				self.key = successor.key
				self.value = successor.value
				return successor.delete(successor.key)
			} else if self.leftChild != nil {
				self.replaceNode(self.leftChild)
				return self.leftChild
			} else if self.rightChild != nil {
				self.replaceNode(self.rightChild)
				return self.rightChild
			} else {
				self.replaceNode(nil)
				return nil
			}
		}
	}
	
	/// Replace `self` with `newNode` in the tree
	///
	/// - Precondition: `self` does not have 2 children
	private func replaceNode(_ newNode: RedBlackTreeNode?) {
		if self.isLeftChild {
			self.parent?.leftChild = newNode
		} else if self.isRightChild {
			self.parent?.rightChild = newNode
		}
		newNode?.parent = self.parent
	}
}

extension RedBlackTreeNode: CustomStringConvertible {
	internal var description: String {
		return "\(self.leftChild?.description ?? "[null]") [\(self.key),\(self.value) - \(self.color)] \(self.rightChild?.description ?? "[null]")"
	}
}