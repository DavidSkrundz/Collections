//
//  RedBlackTree+Insertion.swift
//  Collections
//

extension RedBlackTree {
	/// Inserts the Key/Value pair into the `RedBlackTree` if the Key doesn't exist yet.
	///
	/// - Complexity: O(log n)
	public func insert(_ key: Key, _ value: Value) {
		let newNode = RedBlackTreeNode(key, value)
		
		if root == nil {
			root = newNode
		} else {
			root?.insert(newNode)
		}
		
		self.insertCase1(newNode)
	}
	
	private func insertCase1(_ node: RedBlackTreeNode<Key, Value>) {
		if node.parent == nil {
			node.color = .Black
		} else {
			self.insertCase2(node)
		}
	}
	
	private func insertCase2(_ node: RedBlackTreeNode<Key, Value>) {
		if node.parent!.color == .Black {
			return
		} else {
			self.insertCase3(node)
		}
	}
	
	private func insertCase3(_ node: RedBlackTreeNode<Key, Value>) {
		if node.uncle?.color == .Red {
			node.parent?.color = .Black
			node.uncle?.color = .Black
			node.grandparent?.color = .Red
			self.insertCase1(node.grandparent!) // Able to force since finding an uncle means the grandparent exists
			
		} else {
			self.insertCase4(node)
		}
	}
	
	private func insertCase4(_ node: RedBlackTreeNode<Key, Value>) {
		if node.isRightChild && node.parent?.isLeftChild ?? false {
			self.root = node.parent!.rotateLeft()
			if node.leftChild != nil { self.insertCase5(node.leftChild!) }
		} else if node.isLeftChild && node.parent?.isRightChild ?? false {
			self.root = node.parent!.rotateRight()
			if node.rightChild != nil { self.insertCase5(node.rightChild!) }
		} else {
			self.insertCase5(node)
		}
	}
	
	private func insertCase5(_ node: RedBlackTreeNode<Key, Value>) {
		node.parent?.color = .Black
		node.grandparent?.color = .Red
		if node.isLeftChild {
			self.root = node.grandparent?.rotateRight()
		} else {
			self.root = node.grandparent?.rotateLeft()
		}
	}
}