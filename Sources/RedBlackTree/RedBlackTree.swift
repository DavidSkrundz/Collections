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

/// Temporary extension
extension RedBlackTree {
	public func removeAll() {
		self.root = nil
	}
	
	public func forEach(_ closure: (Value) -> Void) {
		guard self.root != nil else { return }
		
		var node: RedBlackTreeNode! = min(self.root!)
		
		while node != nil {
			closure(node.value)
			node = successor(node)
		}
	}
	
	private func successor(_ node: RedBlackTreeNode<Key, Value>) -> RedBlackTreeNode<Key, Value>? {
//		if node.rightChild != nil {
//			return min(node.rightChild!)
//		}
//		
		var n = node.rightChild
		if n == nil {
			n = node
			while n?.parent != nil && n!.isRightChild {
				n = n?.parent
			}
			return n?.parent
		}
		var m = n
		while n != nil {
			m = n
			n = n?.leftChild
		}
		return m
	}
	
	private func min(_ node: RedBlackTreeNode<Key, Value>) -> RedBlackTreeNode<Key, Value> {
		var node = node
		while node.leftChild != nil {
			node = node.leftChild!
		}
		return node
	}
}

//#        # get to the next, bigger key
//#        n = self.child[1]
//#        if n==None: # no right-child
//#            # find bigger key by checking parents
//#            n = self
//#            while n.parent!=None and n is n.parent.child[1]:
//#                n = n.parent
//#            # n.parent==None or (n!=n.parent.child[1])
//#            # <=>
//#            # n.parent==None or (n==n.parent.child[0])
//#            return n.parent
//#        # find the smallest key amongst the children of the node found
//#        while n!=None:
//#            m = n
//#            n = n.child[0] # moving to smaller keys if possible
//#        return m
