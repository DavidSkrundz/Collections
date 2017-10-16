//
//  Character.swift
//  Generator
//

extension Character {
	internal var isWhitespace: Bool {
		return self == " " ||
			self == "\t" ||
			self == "\n" ||
			self == "\r" ||
			self == "\r\n"
	}
}
