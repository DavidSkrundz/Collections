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
			if nodeToDelete.color == .black {
				if child.color == .red {
					child.color = .black
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
		if sibling?.color == .red {
			node.parent?.color = .red
			sibling?.color = .black
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
		if (node.parent!.color == .black &&
			sibling?.color ?? .black == .black &&
			sibling?.leftChild?.color ?? .black == .black &&
			sibling?.rightChild?.color ?? .black == .black) {
			sibling?.color = .red
			self.deleteCase1(node.parent!)
		} else {
			self.deleteCase4(node)
		}
	}
	
	private func deleteCase4(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		if (node.parent?.color == .red &&
			sibling?.color ?? .black == .black &&
			sibling?.leftChild?.color ?? .black == .black &&
			sibling?.rightChild?.color ?? .black == .black) {
			sibling?.color = .red
			node.parent?.color = .black
		} else {
			self.deleteCase5(node)
		}
	}
	
	private func deleteCase5(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		if (node.isLeftChild &&
			sibling?.rightChild?.color ?? .black == .black &&
			sibling?.leftChild?.color == .red) {
			sibling?.color = .red
			sibling?.leftChild?.color = .black
			self.root = sibling?.rotateRight()
		} else if (node.isRightChild &&
			sibling?.leftChild?.color ?? .black == .black &&
			sibling?.rightChild?.color == .red) {
			sibling?.color = .red
			sibling?.rightChild?.color = .black
			self.root = sibling?.rotateLeft()
		}
		self.deleteCase6(node)
	}

	private func deleteCase6(_ node: RedBlackTreeNode<Key, Value>) {
		let sibling = node.sibling
		sibling?.color = node.parent?.color ?? .black
		node.parent?.color = .black
		if node.isLeftChild {
			sibling?.rightChild?.color = .black
			self.root = node.parent?.rotateLeft()
		} else {
			sibling?.leftChild?.color = .black
			self.root = node.parent?.rotateRight()
		}
	}
}
