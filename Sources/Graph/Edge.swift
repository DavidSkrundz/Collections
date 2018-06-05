//
//  Edge.swift
//  Graph
//

public class Edge<T, U> {
	public var from: Vertex<T>
	public var to: Vertex<T>
	public var data: U?
	
	internal init(from: Vertex<T>, to: Vertex<T>, data: U? = nil) {
		self.from = from
		self.to = to
		self.data = data
	}
}
