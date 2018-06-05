//
//  Array+Duplicates.swift
//  Graph
//

extension Array where Element: Equatable {
	func filterDuplicates() -> [Element] {
		var result = [Element]()
		result.reserveCapacity(self.count)
		for value in self {
			if !result.contains(value) {
				result.append(value)
			}
		}
		return result
	}
}

extension Array {
	func filterDuplicates(_ include: (Element, Element) -> Bool) -> [Element] {
		var result = [Element]()
		self.forEach { element in
			let existingElements = result.filter { include(element, $0) }
			if existingElements.isEmpty {
				result.append(element)
			}
		}
		return result
	}
}
