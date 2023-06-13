//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/13.
//

import UIKit

class CalculatorViewController: UIViewController {
    var expressionString = String()
    var isCompleteOperation = Bool()
    
    @IBOutlet weak var expressionScrollerView: UIScrollView!
    @IBOutlet weak var expressionStackView: UIStackView!
    
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeExpressionString()
        initailizeOperandLabel()
        initailizeOperatorLabel()
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if isValid(operandLabel.text).isZero {
            operandLabel.text = sender.titleLabel?.text
        } else {
            operandLabel.text? += isValid(sender.titleLabel?.text)
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        operandLabel.text = isValid(operandLabel.text).removeTrailingDot
        
        if isValid(operatorLabel.text).isEmpty && isValid(operandLabel.text).isZero {
            return
        }
        
        if isValid(operatorLabel.text).isEmpty, !isValid(operandLabel.text).isZero {
            expressionString += isValid(operandLabel.text)
        }
        
        if !isValid(operatorLabel.text).isEmpty, !isValid(operandLabel.text).isZero {
            expressionString += isValid(operatorLabel.text) + isValid(operandLabel.text)
        }
        
        expressionStackView.addArrangedSubview(makeUILabel(isValid(operatorLabel.text)))
        expressionStackView.addArrangedSubview(makeUILabel(isValid(operandLabel.text)))
        
        operatorLabel.text = sender.titleLabel?.text
        initailizeOperandLabel()
    }
    
    @IBAction func touchUpEqualButton(_ sender: Any) {
        if isCompleteOperation, isValid(operatorLabel.text).isEmpty && isValid(operandLabel.text).isZero {
            return
        }
        
        if isValid(operatorLabel.text).isEmpty, !isValid(operandLabel.text).isZero {
            expressionString += isValid(operandLabel.text)
        }
        
        if !isValid(operatorLabel.text).isEmpty, !isValid(operandLabel.text).isZero {
            expressionString += isValid(operatorLabel.text) + isValid(operandLabel.text)
        }
    
        var formulaStruct = ExpressionParser.parse(from: expressionString)
        operandLabel.text = String(try! formulaStruct.result()) // 에러 처리
        initailizeOperatorLabel()
        initializeExpressionString()
        isCompleteOperation = true
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        if isValid(operandLabel.text).isZero {
            return
        }
        
        operandLabel.text = isValid(operandLabel.text).convertSign
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: Any) {
        initailizeOperandLabel()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: Any) {
        initailizeOperandLabel()
        initailizeOperatorLabel()
        initializeExpressionString()
        isCompleteOperation = false
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        if isValid(operandLabel.text).isZero {
            return
        }
        
        operandLabel.text? += isValid(sender.titleLabel?.text)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if isValid(operandLabel.text).isPrime {
            return
        }
        
        operandLabel.text? += isValid(sender.titleLabel?.text)
    }

    func isValid(_ optionalString: String?) -> String {
        guard let bindingString = optionalString else {
            return ""
        }
        return bindingString
    }
    
    func initailizeOperandLabel() {
        operandLabel.text = "0"
    }
    
    func initailizeOperatorLabel() {
        operatorLabel.text = ""
    }
    
    func initializeExpressionString() {
        expressionString = ""
    }

    private func makeUILabel(_ text: String?) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.textColor = .white
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeUIStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }
    
    private func makeNumberFormat(for input: String) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20

        return numberFormatter.string(for: Double(input)) ?? "0"
    }
}

extension UIScrollView {
    func scrollToBottom() {
        self.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if (bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
