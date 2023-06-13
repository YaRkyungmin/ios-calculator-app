//
//  String.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: "\(target)")
    }
    
    var convertSign: String {
        if self.first == "-" {
            return String(self.dropFirst())
        } else {
            return "-\(self)"
        }
    }
    
    var isPrime: Bool {
        if self.contains(".") {
            return true
        } else {
            return false
        }
    }
    
    var isZero: Bool {
        if self == "0" {
            return true
        } else {
            return false
        }
    }
    
    var removeTrailingDot: String {
        if self.hasSuffix(".") {
            return String(self.dropLast())
        } else {
            return self
        }
    }
}
