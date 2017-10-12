//
//  RedBlackTreeNodeColor.swift
//  Collections
//

internal enum RedBlackTreeNodeColor {
	case red
	case black
}

extension RedBlackTreeNodeColor: CustomStringConvertible {
	internal var description: String {
		switch self {
			case .red:   return "Red"
			case .black: return "Black"
		}
	}
}
