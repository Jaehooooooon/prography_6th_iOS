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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let text = textField.text {
            if let number:Int = Int(text) {
                let vc = segue.destination
                if let nextvc = (vc as? MovieListTableViewController) {
                    nextvc.minimumRating = number
                }
            } else {
                let alert = UIAlertController(title: "알림", message: "숫자만 입력해주세요", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
}
