//
//  LinuxTests.swift
//  Collections
//

import XCTest
@testable import GeneratorTests
@testable import PairTests

XCTMain([
	testCase(GeneratorTests.allTests),
	
	testCase(PairTests.allTests),
])
