//
//  RedBlackTreeNodeColor.swift
//  Collections
//

/// Possible colors for nodes
internal enum RedBlackTreeNodeColor {
	case Red
	case Black
}

extension RedBlackTreeNodeColor: CustomStringConvertible {
	internal var description: String {
		switch self {
			case .Red:   return "Red"
			case .Black: return "Black"
		}
	}
}