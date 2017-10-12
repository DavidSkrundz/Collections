//
//  RedBlackTree+Testing.swift
//  Collections
//

@testable import RedBlackTree

internal struct RedBlackTreeNodeInformation {
	fileprivate let key: Int
	fileprivate let color: RedBlackTreeNodeColor
	
	internal init(_ key: Int, _ color: RedBlackTreeNodeColor) {
		self.key = key
		self.color = color
	}
}

internal func ==(lhs: RedBlackTreeNodeInformation, rhs: RedBlackTreeNodeInformation) -> Bool {
	return lhs.key == rhs.key && lhs.color == rhs.color
}

internal indirect enum RedBlackTreeRepresentation {
	case Null
	case Node(
		RedBlackTreeNodeInformation,
		RedBlackTreeRepresentation,
		RedBlackTreeRepresentation
	)
}

extension RedBlackTreeRepresentation: Equatable {}
internal func ==(lhs: RedBlackTreeRepresentation, rhs: RedBlackTreeRepresentation) -> Bool {
	switch (lhs, rhs) {
		case (.Null, .Null): return true
		case (.Null, _): return false
		case let (.Node(lhs1, lhs2, lhs3), .Node(rhs1, rhs2, rhs3)): return lhs1 == rhs1 && lhs2 == rhs2 && lhs3 == rhs3
		case (.Node(_, _, _), _): return false
	}
}

protocol TestKeyProtocol {}
extension Int: TestKeyProtocol {}

extension RedBlackTreeNode where Key: TestKeyProtocol {
	internal var representation: RedBlackTreeRepresentation {
		return .Node(
			RedBlackTreeNodeInformation(self.key as! Int, self.color),
			self.leftChild?.parent === self ? self.leftChild?.representation ?? .Null : .Null,
			self.rightChild?.parent === self ? self.rightChild?.representation ?? .Null : .Null
		)
	}
}

extension RedBlackTree where Key: TestKeyProtocol {
	internal var representation: RedBlackTreeRepresentation {
		return self.root?.representation ?? .Null
	}
}
