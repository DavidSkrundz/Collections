//
//  Generator.swift
//  Graph
//

public class Graph<T, U> {
	private(set) public var vertices = [Vertex<T>]()
	private(set) public var edges = [Edge<T, U>]()
	
	public init() {}
	
	public func addVertex(_ data: T) -> Vertex<T> {
		let vertex = Vertex(data: data)
		self.vertices.append(vertex)
		return vertex
	}
	
	public func addEdge(from: Vertex<T>, to: Vertex<T>, data: U? = nil) {
		let edge = Edge(from: from, to: to, data: data)
		self.edges.append(edge)
	}
	
	public func neighbours(of vertex: Vertex<T>) -> [Vertex<T>] {
		return self.edges
			.filter { $0.from === vertex }
			.map { $0.to }
			.filterDuplicates(===)
	}
	
	public func reachable(from vertex: Vertex<T>) -> [Vertex<T>] {
		var queue = [vertex]
		var reachable = [Vertex<T>]()
		while !queue.isEmpty {
			let v = queue.removeFirst()
			if !reachable.contains(where: { $0 === v }) {
				reachable.append(v)
				queue.append(contentsOf: self.neighbours(of: v))
			}
		}
		return reachable
	}
	
	public func reachable(from vertex: Vertex<T>,
	                      where canReach: (_ distance: Int, _ edge: U?) -> Bool) -> [Vertex<T>] {
		var queue: [(Vertex<T>, Int, U?)] = [(vertex, 0, nil)]
		var reachable = [Vertex<T>]()
		while !queue.isEmpty {
			let (v, d, e) = queue.removeFirst()
			if !reachable.contains(where: { $0 === v }) {
				if d == 0 || canReach(d, e) {
					reachable.append(v)
					let toQueue = self.edges
						.filter { $0.from === v }
						.map { ($0.to, d+1, $0.data) }
					queue.append(contentsOf: toQueue)
				}
			}
		}
		return reachable
	}
}
