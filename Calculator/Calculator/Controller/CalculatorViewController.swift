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
    
    @IBOutlet weak var scrollerView: UIScrollView!
    @IBOutlet weak var operationsStack: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeExpressionString()
        initailizeOperandLabel()
        initailizeOperatorLabel()
    }
        
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if isEmpty(operatorLabel.text), isZero(operandLabel.text), !isCompleteOperation {
            operandLabel.text = sender.titleLabel?.text
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        if !isEmpty(operatorLabel.text), !isZero(operandLabel.text), !isCompleteOperation {
            expressionString += isValid(operatorLabel.text) + isValid(operandLabel.text)
            operatorLabel.text = sender.titleLabel?.text
            initailizeOperandLabel()
        }
    }
    
    @IBAction func touchUpEqualButton(_ sender: Any) {
        if !isEmpty(operatorLabel.text), !isZero(operandLabel.text), !isCompleteOperation {
            expressionString += isValid(operatorLabel.text) + isValid(operandLabel.text)
            var formulaStruct = ExpressionParser.parse(from: expressionString)
            operandLabel.text = String(try! formulaStruct.result()) // 에러 처리
            initailizeOperatorLabel()
            initializeExpressionString()
            isCompleteOperation = true
        }
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else {
            return
        }
        
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
    
    @IBAction func touchUpSingleZeroButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        
    }
    
    func isZero(_ text: String?) -> Bool {
        guard let zeroString = text else {
            return false
        }
        
        if zeroString == "0" {
            return true
        } else {
            return false
        }
    }
    
    func isNegative(_ text: String) -> Bool {
        if text.first == "-" {
            return true
        } else {
            return false
        }
    }

    func isValid(_ optionalString: String?) -> String {
        guard let bindingString = optionalString else {
            return ""
        }
        return bindingString
    }
    
    func isEmpty(_ text: String?) -> Bool {
        guard let text = text else {
            return true
        }
        
        return text.isEmpty
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
