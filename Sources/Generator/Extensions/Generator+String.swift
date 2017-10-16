//
//  Generator+String.swift
//  Generator
//

// TODO: cleanup

extension Gen where Container == String {
	public mutating func skipWhitespace() {
		while self.peek()?.isWhitespace ?? false {
			self.advance()
		}
	}
}
