//
//  LinuxTests.swift
//  Collections
//

@testable import RedBlackTree
import XCTest

XCTMain([
	testCase(RedBlackInsertionTreeTests.allTests),
	testCase(RedBlackTreeDeletionTests.allTests),
	testCase(RedBlackTreeNodeTests.allTests),
	testCase(RedBlackTreeNodeRotationTests.allTests),
])