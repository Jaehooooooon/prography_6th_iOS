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
        
        requestMovies(minimumRating: minimumRating)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveMoviesNoti(_:)), name: DidReceiveMoivesNoti, object: nil)
    }

    @objc func didReceiveMoviesNoti(_ noti: Notification) {
        print("didReceiveMoviesNoti")
        guard let movies: [Movie] = noti.userInfo!["movies"] as? [Movie] else { return }

        for movie in movies {
            self.movies.append(movie)
        }
        self.tableView.reloadData()
    }
    
    @IBAction func touchUpNextButton() {
        requestMovies(minimumRating: minimumRating)
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
            cell.titleLabel.text = movie.title
            cell.ratingLabel.text = String(format:"%.1f", movie.rating ?? 0)
        }
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? MovieListTableViewCell {
            let vc = segue.destination
            if let nextvc = (vc as? MovieDetailViewController) {
                nextvc.titleToSet = cell.titleLabel.text
                nextvc.ratingToSet = cell.ratingLabel.text
            }
        }
    }
    

}
