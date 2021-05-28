//
//  PostView.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 27.05.2021.
//

import UIKit

class PostView:  UIView {
    var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.bounces = true
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    var pager: UIPageControl = {
        let pager = UIPageControl()
        pager.translatesAutoresizingMaskIntoConstraints = false
        pager.backgroundColor = .alphaBackground
        pager.pageIndicatorTintColor = .white
        pager.currentPageIndicatorTintColor = .link
        pager.layer.cornerRadius = 8
        return pager
    }()

    var closeButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        button.tintColor = .white
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.layer.cornerRadius = 22
        button.backgroundColor = .alphaBackground
        return button
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.bold18
        label.textColor = UIColor.text
        label.numberOfLines = 0
        return label
    }()

    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.medium16
        label.textColor = UIColor.text
        label.numberOfLines = 0
        return label
    }()
    
    var buyButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.medium16
        button.layer.cornerRadius = 6
        button.backgroundColor = UIColor.link
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return button
    }()

    var descriptionsHolder: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        return stackView
    }()

    override init(frame:CGRect) {
        super.init(frame:frame)

        backgroundColor = .white
        
        setupViews()
    }

    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
    }

    fileprivate func setupViews() {
        addSubview(containerView)

        if #available(iOS 11.0, *) {
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: statusBarHeight).isActive = true
        }
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        containerView.addSubview(collectionView)
        containerView.addSubview(closeButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(buyButton)
        containerView.addSubview(descriptionsHolder)
        containerView.addSubview(pager)

        collectionView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: isIpad ? 1 / 3 : 1 / 1.5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        pager.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -5).isActive = true
        pager.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 7).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -5).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true

        buyButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        buyButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true

        descriptionsHolder.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 20).isActive = true
        descriptionsHolder.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionsHolder.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        descriptionsHolder.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor).isActive = true
    }
}
