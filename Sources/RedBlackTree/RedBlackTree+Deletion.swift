//
//  RedBlackTree+Deletion.swift
//  Collections
//

extension RedBlackTree {
	/// Delete the node with the given `key`
	///
	/// - Complexity: O(log n)
	public func delete(key: Key) {
		guard let root = self.root else { return }
		
		if let nodeToDelete = root.delete(key) {
			let child = nodeToDelete.leftChild != nil ? nodeToDelete.leftChild! : nodeToDelete.rightChild!
			if nodeToDelete.color == .Black {
				if child.color == .Red {
					child.color = .Black
				} else {
					self.deleteCase1(child)
				}
			}
		}
	}
	
	private func deleteCase1(_ node: RedBlackTreeNode<Key, Value>) {
		if node.parent != nil {
			self.deleteCase2(node)
		}
	}
	
	private func deleteCase2(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		if sibling?.color == .Red {
			node.parent?.color = .Red
			sibling?.color = .Black
			if node.isLeftChild {
				self.root = node.parent?.rotateLeft()
			} else {
				self.root = node.parent?.rotateRight()
			}
		}
		self.deleteCase3(node)
	}
	
	private func deleteCase3(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		if (node.parent!.color == .Black &&
			sibling?.color ?? .Black == .Black &&
			sibling?.leftChild?.color ?? .Black == .Black &&
			sibling?.rightChild?.color ?? .Black == .Black) {
			sibling?.color = .Red
			self.deleteCase1(node.parent!)
		} else {
			self.deleteCase4(node)
		}
	}
	
	private func deleteCase4(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		if (node.parent?.color == .Red &&
			sibling?.color ?? .Black == .Black &&
			sibling?.leftChild?.color ?? .Black == .Black &&
			sibling?.rightChild?.color ?? .Black == .Black) {
			sibling?.color = .Red
			node.parent?.color = .Black
		} else {
			self.deleteCase5(node)
		}
	}
	
	private func deleteCase5(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		if (node.isLeftChild &&
			sibling?.rightChild?.color ?? .Black == .Black &&
			sibling?.leftChild?.color == .Red) {
			sibling?.color = .Red
			sibling?.leftChild?.color = .Black
			self.root = sibling?.rotateRight()
		} else if (node.isRightChild &&
			sibling?.leftChild?.color ?? .Black == .Black &&
			sibling?.rightChild?.color == .Red) {
			sibling?.color = .Red
			sibling?.rightChild?.color = .Black
			self.root = sibling?.rotateLeft()
		}
		self.deleteCase6(node)
	}

	private func deleteCase6(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		sibling?.color = node.parent?.color ?? .Black
		node.parent?.color = .Black
		if node.isLeftChild {
			sibling?.rightChild?.color = .Black
			self.root = node.parent?.rotateLeft()
		} else {
			sibling?.leftChild?.color = .Black
			self.root = node.parent?.rotateRight()
		}
	}
}