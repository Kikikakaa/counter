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
    
    @IBOutlet private weak var lastValueLabel: UILabel!
    
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastValue = loadCounterValue()
        lastValueLabel.text = "Последнее значение: \(lastValue)"
        counterLabel.text = "Значение счетчика: \(count)"
        plusButton.tintColor = .red
        historyTextView.isEditable = false
        historyTextView.text = "История изменений: \n"
        let history = loadHistory()
        historyTextView.text += history.joined(separator: "\n")
     }
    
    private func addHistory (description: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = dateFormatter.string(from: Date())
        let historyEntry = "\(currentDate): \(description)"
        historyTextView.text += "\n" + historyEntry 
        var history = loadHistory()
        history.append(historyEntry)
        saveHistory(history)

    }
    
    private func saveHistory(_ history: [String]) {
        UserDefaults.standard.set(history, forKey: "counterHistory")
    }

    private func loadHistory() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "counterHistory") ?? []
    }
    
    private func saveCounterValue(_ count: Int) {
        UserDefaults.standard.set(count, forKey: "counterValue")
    }

    private func loadCounterValue() -> Int {
        return UserDefaults.standard.integer(forKey: "counterValue")
    }
    
    @IBAction private func mainButtonDidTap(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
        saveCounterValue(count)
    }
    
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
        saveCounterValue(count)
        addHistory(description: "значение изменено на +1")
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if count > 0 { count -= 1; addHistory(description: "значение изменено на -1")
        } else {
            addHistory(description: "попытка уменьшить значение счётчика ниже 0")
        }
        counterLabel.text = "Значение счетчика: \(count)"
        saveCounterValue(count)
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счетчика: \(count)"
        saveCounterValue(count)
        addHistory(description: "значение сброшено")
    }
}

