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
    
    var ratingSelected: Int?
    var ratingToPick: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
