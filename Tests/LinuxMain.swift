//
//  LinuxTests.swift
//  Collections
//

import XCTest
@testable import RedBlackTreeTests

XCTMain([
	testCase(RedBlackTreeInsertionTests.allTests),
	testCase(RedBlackTreeDeletionTests.allTests),
	testCase(RedBlackTreeNodeTests.allTests),
	testCase(RedBlackTreeNodeRotationTests.allTests),
	testCase(RedBlackTreeCollectionTests.allTests),
])
