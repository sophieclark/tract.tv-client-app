//
//  MovieCollectionViewController.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import UIKit



class MovieCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let reuseIdentifier = "movieListCell"
  var movies = [Movie]()
  let viewModel = MovieCollectionViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    getMovies()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Register cell classes
    //self.collectionView!.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    
//  }

  // MARK: UICollectionViewDataSource

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
  }


  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of items
      return movies.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
    let movie = movies[indexPath.row]
    cell.configure(with: movie)
    // Configure the cell
  
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let viewSize = view.bounds.size
    let spacing: CGFloat = 0.5
    let width = (viewSize.width / 2) - spacing
    let height = (viewSize.height / 3) - spacing
    return CGSize(width: width, height: height)
  }
  
  func getMovies() {
    viewModel.getMovies(withSuccess: { (movie) in
      self.movies = movie
      self.collectionView?.reloadData()
      }, withFailure: { (error) in
        //show alert
    })
  }

}
