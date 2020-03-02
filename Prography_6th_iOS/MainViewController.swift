//
//  MainViewController.swift
//  Prography_6th_iOS
//
//  Created by 서재훈 on 2020/03/01.
//  Copyright © 2020 서재훈. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    var ratingSelected: Int?
    var ratingToPick: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.layer.cornerRadius = 7
        nextButton.layer.shadowColor = UIColor.black.cgColor
        nextButton.layer.shadowRadius = 10
        nextButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        nextButton.layer.shadowOpacity = 0.5
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let number = self.ratingSelected {
            let vc = segue.destination
            if let nextvc = (vc as? MovieListTableViewController) {
                nextvc.minimumRating = number
            }
        }
    }
    
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.ratingToPick.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(ratingToPick[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.ratingSelected = ratingToPick[row]
    }
}
