//
//  MovieListTableViewController.swift
//  Prography_6th_iOS
//
//  Created by 서재훈 on 2020/03/02.
//  Copyright © 2020 서재훈. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    static let identifier = "MovieListTableViewController"
    
    var minimumRating = 0
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showSpinner(onView: self.view)
        requestMovies(minimumRating: minimumRating, limit: 10)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveMoviesNoti(_:)), name: DidReceiveMoivesNoti, object: nil)
    }

    @objc func didReceiveMoviesNoti(_ noti: Notification) {
        print("didReceiveMoviesNoti")
        guard let movies: [Movie] = noti.userInfo!["movies"] as? [Movie] else { return }

        self.movies = movies
        self.tableView.reloadData()
        self.removeSpinner()
    }
    
    @IBAction func touchUpNextButton() {
        var nextLimit = self.movies.count + 10
        if nextLimit > 50 {
            nextLimit = 50
        }
        self.showSpinner(onView: self.view)
        requestMovies(minimumRating: minimumRating, limit: nextLimit)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath)
        let movie = self.movies[indexPath.row]
        if let cell = (cell as? MovieListTableViewCell) {
            cell.movie = movie
            cell.update()
            cell.layer.borderWidth = 0.3
        }
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? MovieListTableViewCell {
            let vc = segue.destination
            if let nextvc = (vc as? MovieDetailViewController) {
                if let movie = cell.movie {
                    nextvc.titleToSet = movie.title
                    nextvc.ratingToSet = String(format:"%.1f", movie.rating ?? 0)
                    nextvc.imageUrlToSet = movie.mediumCoverImage
                }
            }
        }
    }
    
}

var vSpinner : UIView?
extension UIViewController {
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = onView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
