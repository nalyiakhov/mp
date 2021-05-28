//
//  MainVC.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 26.05.2021.
//

import UIKit

class MainVC: UIViewController {
    let cellIdentifier = "postCellIdentifier"

    var mainView: MainView {
        return view as! MainView
    }

    let itemsPerRow: CGFloat = isIpad ? 4 : 2
    let sectionInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

    weak var containerView: UIView! { return mainView.containerView }
    weak var collectionView: UICollectionView! { return mainView.collectionView }
    weak var backgroundView: UIView! { return mainView.backgroundView }
    weak var placeholderView: UIView! { return mainView.placeholderView }
    weak var loadingIndicator: MaterialActivityIndicatorView! { return mainView.loadingIndicator }
    
    var posts: [Post] = []

    override func loadView() {
        self.view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        loadPosts()
    }

    fileprivate func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    fileprivate func loadPosts() {
        loadingIndicator.startAnimating()
        Post.getPosts { (posts) in
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
                if let loadedPosts = posts, loadedPosts.count > 0 {
                    self.posts = loadedPosts
                    self.collectionView.reloadData()
                } else {
                    self.placeholderView.isHidden = false
                }
            }
        }
    }
}

