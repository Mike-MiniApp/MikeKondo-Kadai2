//
//  ViewController.swift
//  MikeKondo-Kadai2
//
//  Created by 近藤米功 on 2022/03/27.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var calculateSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var calculatedResultLabel: UILabel!

    private enum CalculationMethod: Int {
        case addition
        case subtraction
        case mutiplication
        case division
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        number1TextField.delegate = self
        number2TextField.delegate = self
        number1TextField.keyboardType = .numberPad
        number2TextField.keyboardType = .numberPad
    }

    @IBAction private func tappedCalculateButton(_ sender: Any) {
        let num1: Float = Float(number1TextField.text ?? "") ?? 0
        let num2: Float = Float(number2TextField.text ?? "") ?? 0
        calculateAction(number1: num1, number2: num2)
    }

    private func calculateAction(number1: Float, number2: Float) {
        let index = calculateSegmentedControl.selectedSegmentIndex
        guard let calculationMethod = CalculationMethod(rawValue: index) else {
            return
        }

        let resultText: String

        switch calculationMethod {
        case .addition:
            resultText = String(number1 + number2)
        case .subtraction:
            resultText = String(number1 - number2)
        case .mutiplication:
            resultText = String(number1 * number2)
        default:
            if number2 == 0 {
                resultText = "割る数には0以外を入力してください"
            } else {
                resultText = String(number1 / number2)
            }
        }

        calculatedResultLabel.text = resultText
    }
}

extension CalculateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
