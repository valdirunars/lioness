//
//  Runner+Tests.swift
//  Lioness
//
//  Created by Louis D'hauwe on 22/10/2016.
//  Copyright © 2016 - 2017 Silver Fox. All rights reserved.
//

import XCTest
@testable import Lioness

class Runner_Tests: BaseTestCase {
	
	// MARK: - Tests
	
	func testCommentLineAndBlock() {
		assert(in: "CommentLineAndBlock", that: "a", equals: .number(2), useStdLib: false)
	}
	
	func testCommentEmptyOneLineComment() {
		assert(in: "EmptyOneLineComment", that: "a", equals: .number(2), useStdLib: false)
	}
	
	func testCommentAfterAssignment() {
		assert(in: "CommentAfterAssignment", that: "a", equals: .number(2), useStdLib: false)
	}
	
	func testCommentBlockAfterAssignment() {
		assert(in: "CommentBlockAfterAssignment", that: "a", equals: .number(2), useStdLib: false)
	}
	
	func testUnusedFunctionResult() {
		
		let interpreter = try? execute("UnusedFunctionResult")
		
		XCTAssert(interpreter?.stack.isEmpty == true, "Expected stack to be empty")
	}
	
	func testStructUpdate() {
		let expectedStruct = ValueType.struct([1: .number(3), 2: .number(2), 3: .number(3)])
		assert(in: "StructUpdate", that: "bar", equals: expectedStruct, useStdLib: false)
	}
	
	func testUnicodeSumFunction() {
		assert(in: "UnicodeSumFunction", that: "😀", equals: .number(5))
	}
	
	func testBinaryOp() {
		assert(in: "BinaryOp", that: "a", equals: .number(512.75))
	}
	
	func testInnerWhileLoops() {
		assert(in: "InnerWhileLoops", that: "sum", equals: .number(7_255_941_120))
	}
	
	func testGCD() {
		assert(in: "GreatestCommonDivisor", that: "a", equals: .number(4))
	}
	
	func testFibonacci() {
		assert(in: "Fibonacci", that: "a", equals: .number(55))
	}
	
	func testFunctionGlobalVar() {
		assert(in: "FunctionGlobalVar", that: "a", equals: .number(12))
	}
	
	func testDoTimesLoops() {
		assert(in: "DoTimesLoops", that: "a", equals: .number(10000))
	}
	
	func testFunctionReturnGlobalVar() {
		assert(in: "FunctionReturnGlobalVar", that: "a", equals: .number(12))
	}
	
	func testFunctionInFunction() {
		assert(in: "FunctionInFunction", that: "a", equals: .number(100))
	}
	
	func testVarAssignAfterScopeLeave() {
		assert(in: "VarAssignAfterScopeLeave", that: "a", equals: .number(1))
	}
	
	func testRepeatWhileStatement() {
		assert(in: "RepeatWhileStatement", that: "i", equals: .number(16))
	}

}
