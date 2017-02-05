//
//  BytecodeInstructionType.swift
//  Lioness
//
//  Created by Louis D'hauwe on 09/10/2016.
//  Copyright © 2016 - 2017 Silver Fox. All rights reserved.
//

import Foundation

/// Scorpion Bytecode Instruction Type
///
/// Enum cases are lower camel case (per Swift guideline)
///
/// Instruction command descriptions are lower snake case
public enum BytecodeInstructionType: UInt8, CustomStringConvertible {
	
	// TODO: add documentation with stack before/after execution
	
	case pushConst = 0
	case add = 1
	case sub = 2
	case mul = 3
	case div = 4
	case pow = 5
	
	case and = 6
	case or = 7
	case not = 8
	
	/// Equal
	case eq = 9
	/// Not equals
	case neq = 10
	
	case ifTrue = 11
	case ifFalse = 12

	/// Compare less than or equal
	case cmple = 13
	
	/// Compare less than
	case cmplt = 14

	
	case goto = 15

	case registerStore = 16
	case registerUpdate = 17
	case registerClear = 18
	case registerLoad = 19
	
	case invokeFunc = 20

	case exitFunc = 21

	case pop = 22

	case skipPast = 23
	
	case structInit = 24
	case structSet = 25
	case structUpdate = 26
	case structGet = 27
	
	public var opCode: UInt8 {
		return self.rawValue
	}
	
	public var description: String {
		
		switch self {
		
		case .pushConst:
			return "push_const"
		
		case .add:
			return "add"
			
		case .sub:
			return "sub"
			
		case .mul:
			return "mul"
			
		case .div:
			return "div"
			
		case .pow:
			return "pow"
			
		case .and:
			return "and"
			
		case .or:
			return "or"
			
		case .not:
			return "not"
			
		case .eq:
			return "eq"
			
		case .neq:
			return "neq"
		
		case .ifTrue:
			return "if_true"
		
		case .ifFalse:
			return "if_false"
			
		case .cmple:
			return "cmple"
		
		case .cmplt:
			return "cmplt"
			
		case .goto:
			return "goto"
			
		case .registerStore:
			return "reg_store"
			
		case .registerUpdate:
			return "reg_update"
			
		case .registerClear:
			return "reg_clear"
			
		case .registerLoad:
			return "reg_load"
			
		// TODO: rename to "virtual"?
		case .invokeFunc:
			return "invoke_func"
			
		// TODO: rename to "virtual"?
		case .exitFunc:
			return "exit_func"
			
		case .pop:
			return "pop"
			
		case .skipPast:
			return "skip_past"
			
		case .structInit:
			return "struct_init"

		case .structSet:
			return "struct_set"
			
		case .structUpdate:
			return "struct_update"
			
		case .structGet:
			return "struct_get"
			
		}
		
	}
	
}