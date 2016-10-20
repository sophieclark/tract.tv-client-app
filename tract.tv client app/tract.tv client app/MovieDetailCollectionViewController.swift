//
//  MovieDetailCollectionViewController.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 20/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//
import Foundation
import Alamofire
import AlamofireImage
import UIKit
import IOStickyHeader


class MovieDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  let reuseIdentifier = "Cell"
  var movie: Movie?
  let headerNib = UINib(nibName: "MovieDetailHeaderCell", bundle: Bundle.main)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupCollectionView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupCollectionView() {
    self.collectionView?.dataSource = self
    self.collectionView?.delegate = self
    
    if let layout: IOStickyHeaderFlowLayout = self.collectionView?.collectionViewLayout as? IOStickyHeaderFlowLayout {
      layout.parallaxHeaderReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 360)
      layout.parallaxHeaderMinimumReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 0)
      layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: layout.itemSize.height)
      layout.parallaxHeaderAlwaysOnTop = true
      layout.disableStickyHeaders = true
      self.collectionView?.collectionViewLayout = layout
    }
    
    self.collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    self.collectionView?.register(self.headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "headerCell")
  }

  // MARK: UICollectionViewDataSource

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }


  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return 1
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.row {
    case 0:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieTitleCell", for: indexPath) as! MovieTitleCollectionViewCell
      cell.titleLabel.text = movie?.title
      cell.yearLabel.text = "\(movie?.year)"
      return cell
    case 1:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "summaryCell", for: indexPath) as! MovieSummaryCollectionViewCell
      cell.summaryLabel.text = movie?.overview
      return cell
    default:
      return UICollectionViewCell()
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case IOStickyHeaderParallaxHeader:
      let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as! MovieDetailHeaderCell
      cell.configure(with: movie!)
      return cell
    default:
      assert(false, "Unexpected element kind")
    }
  }

  // MARK: UICollectionViewDelegate

  /*
  // Uncomment this method to specify if the specified item should be highlighted during tracking
  override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
      return true
  }
  */

  /*
  // Uncomment this method to specify if the specified item should be selected
  override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
      return true
  }
  */

  /*
  // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
  override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
      return false
  }

  override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
      return false
  }

  override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
  
  }
  */

}
