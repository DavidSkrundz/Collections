//
//  LinuxTests.swift
//  Collections
//

import XCTest
@testable import GeneratorTests
@testable import GraphTests
@testable import PairTests

XCTMain([
	testCase(GeneratorTests.allTests.shuffled()),
	
	testCase(GraphTests.allTests.shuffled()),
	
	testCase(PairTests.allTests.shuffled()),
])
