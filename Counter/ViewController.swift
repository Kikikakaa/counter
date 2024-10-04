//
//  ViewController.swift
//  Counter
//
//  Created by user on 28.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var counterButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счетчика: \(count)"
        plusButton.tintColor = .red
        historyTextView.isEditable = false
        historyTextView.text = "История изменений: \n"
    }
    
    private func addHistory (description: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = dateFormatter.string(from: Date())
        historyTextView.text += "\(currentDate): \(description) \n"
    }
    
    @IBAction private func mainButtonDidTap(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
    }
    
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
        addHistory(description: "значение изменено на +1")
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if count > 0 { count -= 1; addHistory(description: "значение изменено на -1")
        } else {
            addHistory(description: "попытка уменьшить значение счётчика ниже 0")
        }
        counterLabel.text = "Значение счетчика: \(count)"
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счетчика: \(count)"
        addHistory(description: "значение сброшено")
    }
}

