//
//  PostVC.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 27.05.2021.
//

import UIKit

class PostVC: UIViewController {
    let cellIdentifier = "imageCellIdentifier"

    var postView: PostView {
        return view as! PostView
    }

    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        return layout
    }()

    weak var containerView: UIView! { return postView.containerView }
    weak var collectionView: UICollectionView! { return postView.collectionView }
    weak var closeButton: UIButton! { return postView.closeButton }
    weak var titleLabel: UILabel! { return postView.titleLabel }
    weak var descriptionLabel: UILabel! { return postView.descriptionLabel }
    weak var descriptionsHolder: UIStackView! { return postView.descriptionsHolder }
    weak var buyButton: UIButton! { return postView.buyButton }
    weak var pager: UIPageControl! { return postView.pager }

    var post: Post!

    init(post: Post) {
        super.init(nibName: nil, bundle: nil)

        self.post = post
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        self.view = PostView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupViews()
        
        closeButton.addTarget(self, action: #selector(doClose), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(doBuy), for: .touchUpInside)
    }

    fileprivate func setupCollectionView() {
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    fileprivate func setupViews() {
        titleLabel.text = post.title
        descriptionLabel.text = post.description
        buyButton.setTitle(String(post.price) + "₽", for: .normal)
        
        var descriptons: [String: String] = [:]
        if let isUsed = post.isUsed {
            descriptons["Состояние"] = isUsed == 0 ? "Новый" : "Б\\у"
        }
        if let vendorCode = post.vendorCode {
            descriptons["Код"] = vendorCode
        }
        descriptons["Доставка"] = post.delivery == 0 ? "Бесплатная доставка" : (post.delivery == 1 ? "За счет покупателя" : "Самовывоз")
        
        for (name,value) in descriptons {
            let descriptionView = DescriptionView(name: name, value: value)
            descriptionView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            descriptionsHolder.addArrangedSubview(descriptionView)
        }
    }

    @objc fileprivate func doClose() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc fileprivate func doBuy() {
        print(#function, post.id)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pager.currentPage = Int((collectionView.contentOffset.x / collectionView.frame.width).rounded(.toNearestOrAwayFromZero))
    }
}

