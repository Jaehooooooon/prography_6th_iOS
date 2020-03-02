//
//  MovieDetailViewController.swift
//  Prography_6th_iOS
//
//  Created by 서재훈 on 2020/03/02.
//  Copyright © 2020 서재훈. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var titleToSet: String?
    var ratingToSet: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let title = self.titleToSet, let rating = self.ratingToSet {
            titleLabel.text = title
            ratingLabel.text = rating
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
