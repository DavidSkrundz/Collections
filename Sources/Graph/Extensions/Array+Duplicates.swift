//
//  Array+Duplicates.swift
//  Graph
//

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
