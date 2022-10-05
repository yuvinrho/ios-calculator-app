//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    var currentInputNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchCalculatorButton(_ sender: UIButton) {
        
        guard let key: CalculatorKeypad = CalculatorKeypad(rawValue: sender.currentTitle ?? "") else {
            return
        }
        
        switch key {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .doubleZero:
            inputNumber(key.rawValue)
            print(currentInputNumber)
        case .dot:
            print(key.rawValue)
        case .add, .subtract, .multiply, .divide:
            print(key.rawValue)
        case .ac:
            print(key.rawValue)
        case .ce:
            print(key.rawValue)
        case .plusMinus:
            print(key.rawValue)
        case .equal:
            print(key.rawValue)
        }
    }
    
    private func inputNumber(_ number: String) {
        currentInputNumber += number
    }
}

