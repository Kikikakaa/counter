//
//  ViewController.swift
//  Counter
//
//  Created by user on 28.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MainLabel: UILabel!
    
    @IBOutlet weak var MainButton: UIButton!
    
    @IBOutlet weak var MinusButton: UIButton!
    
    @IBOutlet weak var PlusButton: UIButton!
    
    @IBOutlet weak var ResetButton: UIButton!
    
    @IBOutlet weak var HistoryTextView: UITextView!
    
    
    private var count: Int = 0
    
    
    
    private func addHistory (description: String) {
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = dateFormatter.string(from: Date())

        HistoryTextView.text += "\(currentDate): \(description) \n"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MainLabel.text = "Значение счетчика: \(count)"
        PlusButton.tintColor = .red
        HistoryTextView.isEditable = false
        HistoryTextView.text = "История изменений: \n"
       
    }
    
    @IBAction func mainButtonDidTap(_ sender: Any) {
        count += 1
        MainLabel.text = "Значение счетчика: \(count)"
            }
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        count += 1
        MainLabel.text = "Значение счетчика: \(count)"
        addHistory(description: "значение изменено на +1")
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if count > 0 { count -= 1 }
        else { return }
        MainLabel.text = "Значение счетчика: \(count)"
        
        if count == 0 {
            addHistory(description: "попытка уменьшить значение счётчика ниже 0")
        } else { addHistory(description: "значение изменено на -1")
        }
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        count = 0
        MainLabel.text = "Значение счетчика: \(count)"
        addHistory(description: "значение сброшено")
    }
    
}

