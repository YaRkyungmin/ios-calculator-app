//
//  Formula.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/07.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var accumulateValue = operands.dequeue() else {
            throw OperationError.operandNotEnoughError
        }

        while let nextOperand = operands.dequeue() {
            guard let operatorsElement = operators.dequeue() else {
                throw OperationError.operatorNotEnoughError
            }
            
            accumulateValue = operatorsElement.calculate(lhs: accumulateValue, rhs: nextOperand)
            
            if accumulateValue.isInfinite || accumulateValue.isNaN {
                throw OperationError.divideByZeroError
            }
        }
        
        return accumulateValue
    }
}
