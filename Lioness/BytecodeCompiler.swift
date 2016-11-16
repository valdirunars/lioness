//
//  BytecodeCompiler.swift
//  Lioness
//
//  Created by Louis D'hauwe on 07/10/2016.
//  Copyright © 2016 Silver Fox. All rights reserved.
//

import Foundation

/// Scorpion Bytecode Compiler
public class BytecodeCompiler {
	
	// MARK: - Private
	
	fileprivate let ast: [ASTNode]
	fileprivate var index = 0
	
	fileprivate var scopeStartStack = [String]()

	fileprivate let scopeTreeRoot: ScopeNode

	fileprivate var currentScopeNode: ScopeNode

	
	// MARK: -

	public init(ast: [ASTNode]) {
		self.ast = ast
		scopeTreeRoot = ScopeNode(childNodes: [])
		currentScopeNode = scopeTreeRoot
	}
	
	// MARK: - Public
	
	public func compile() throws -> [BytecodeInstruction] {
		
		currentScopeNode = scopeTreeRoot
		
		var bytecode = [BytecodeInstruction]()

		for node in ast {
			
			let compiled = try node.compile(with: self)
			bytecode.append(contentsOf: compiled)
			
		}
		
		return bytecode
	}
	
	// MARK: - Labels

	func nextIndexLabel() -> String {
		index += 1
		return "\(index)"
	}
	
	func peekNextIndexLabel() -> String {
		return "\(index + 1)"
	}
	
	// MARK: - Scope start stack

	func pushScopeStartStack(_ label: String) {
		scopeStartStack.append(label)
	}

	func popScopeStartStack() -> String? {
		return scopeStartStack.popLast()
	}
	
	func peekScopeStartStack() -> String? {
		return scopeStartStack.last
	}
	
	// MARK: - Scope tree

	func enterNewScope() {
		
		let newScopeNode = ScopeNode(parentNode: currentScopeNode, childNodes: [])
		currentScopeNode.childNodes.append(newScopeNode)
		currentScopeNode = newScopeNode
		
	}

	// TODO: make leave return the left scope map for register cleanup
	func leaveCurrentScope() throws {
		
		guard let parentNode = currentScopeNode.parentNode else {
			// End of program reached (top scope left)
			return
		}
		
		guard let i = parentNode.childNodes.index(where: { (s) -> Bool in
			return s === currentScopeNode
		}) else {
			
			// TODO: throw error
			return
		}
		
		parentNode.childNodes.remove(at: i)
		currentScopeNode = parentNode

	}
	
	// MARK: - Registers
	
	fileprivate var registerCount = 0

	func getRegister(`for` varName: String) -> String {
		
		if let existingReg = currentScopeNode.deepRegisterMap()[varName] {
			return existingReg
		}
		
		let newReg = getNewRegister()
		currentScopeNode.registerMap[varName] = newReg
		
		return newReg
	}
	
	fileprivate func getNewRegister() -> String {
		registerCount += 1
		let newReg = "r\(registerCount)"
		return newReg
	}
	
}
