//
//  LinuxTests.swift
//  Collections
//

import XCTest
@testable import GeneratorTests
@testable import GraphTests
@testable import PairTests

XCTMain([
	testCase(GeneratorTests.allTests),
	
	testCase(GraphTests.allTests),
	
	testCase(PairTests.allTests),
])
