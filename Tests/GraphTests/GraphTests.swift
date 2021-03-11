//
//  GeneratorTests.swift
//  Graph
//

import XCTest
import Graph

final class GraphTests: XCTestCase {
	func testNeighbours() {
		let g = Graph<Int,Void>()
		
		let v1 = g.addVertex(1)
		let v2 = g.addVertex(2)
		let v3 = g.addVertex(3)
		let v4 = g.addVertex(4)
		let v5 = g.addVertex(5)
		
		g.addEdge(from: v1, to: v2)
		g.addEdge(from: v1, to: v3)
		g.addEdge(from: v2, to: v3)
		g.addEdge(from: v2, to: v4)
		g.addEdge(from: v4, to: v5)
		g.addEdge(from: v4, to: v1)
		g.addEdge(from: v4, to: v2)
		
		let v1n = g.neighbours(of: v1)
		let v2n = g.neighbours(of: v2)
		let v3n = g.neighbours(of: v3)
		let v4n = g.neighbours(of: v4)
		let v5n = g.neighbours(of: v5)
		
		XCTAssertEqual(v1n, [v2,v3])
		XCTAssertEqual(v2n, [v3,v4])
		XCTAssertEqual(v3n, [])
		XCTAssertEqual(v4n, [v5,v1,v2])
		XCTAssertEqual(v5n, [])
	}
	
	func testReachable() {
		let g = Graph<Int,Void>()
		
		let v1 = g.addVertex(1)
		let v2 = g.addVertex(2)
		let v3 = g.addVertex(3)
		let v4 = g.addVertex(4)
		let v5 = g.addVertex(5)
		
		g.addEdge(from: v1, to: v2)
		g.addEdge(from: v1, to: v3)
		g.addEdge(from: v2, to: v3)
		g.addEdge(from: v2, to: v4)
		g.addEdge(from: v4, to: v5)
		g.addEdge(from: v4, to: v1)
		g.addEdge(from: v4, to: v2)
		
		let r1 = g.reachable(from: v1)
		let r2 = g.reachable(from: v2)
		let r3 = g.reachable(from: v3)
		let r4 = g.reachable(from: v4)
		let r5 = g.reachable(from: v5)
		
		XCTAssertEqual(r1, [v1,v2,v3,v4,v5])
		XCTAssertEqual(r2, [v2,v3,v4,v5,v1])
		XCTAssertEqual(r3, [v3])
		XCTAssertEqual(r4, [v4,v5,v1,v2,v3])
		XCTAssertEqual(r5, [v5])
	}
	
	func testReachableWhere() {
		let g = Graph<Int,Int>()
		
		let v1 = g.addVertex(1)
		let v2 = g.addVertex(2)
		let v3 = g.addVertex(3)
		let v4 = g.addVertex(4)
		let v5 = g.addVertex(5)
		
		g.addEdge(from: v1, to: v2, data: 1)
		g.addEdge(from: v1, to: v3, data: 1)
		g.addEdge(from: v1, to: v5, data: 0)
		g.addEdge(from: v2, to: v3, data: 0)
		g.addEdge(from: v2, to: v4, data: 1)
		g.addEdge(from: v4, to: v1, data: 0)
		g.addEdge(from: v4, to: v2, data: 0)
		
		let reach = g.reachable(from: v1) { $0 < 2 && $1 == 1 }
		
		XCTAssertEqual(reach, [v1,v2,v3])
	}
}

extension Vertex: Equatable where T: Equatable {}

public func == <T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool where T: Equatable {
	return lhs.data == rhs.data
}
