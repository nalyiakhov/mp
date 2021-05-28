//
//  MainView.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 26.05.2021.
//

import UIKit

class MainView:  UIView {
    var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var backgroundView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var placeholderView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    var placeholderTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.medium24
        label.textColor = .text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "Нет постов"
        return label
    }()

    var placeholderDescription: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.regular16
        label.textColor = .text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "Тут пока нет постов"
        return label
    }()

    var loadingIndicator: MaterialActivityIndicatorView = {
        let indicator = MaterialActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .link
        indicator.lineWidth = 4
        indicator.isUserInteractionEnabled = false
        return indicator
    }()
    
    var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.bounces = true
        return collectionView
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

        collectionView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

        collectionView.backgroundView = backgroundView
        collectionView.backgroundView?.translatesAutoresizingMaskIntoConstraints = false

        backgroundView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

        backgroundView.addSubview(placeholderView)
        backgroundView.addSubview(loadingIndicator)
        
        placeholderView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: statusBarHeight).isActive = true
        placeholderView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 5).isActive = true
        placeholderView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -5).isActive = true
        
        loadingIndicator.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        loadingIndicator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        loadingIndicator.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loadingIndicator.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        placeholderView.addSubview(placeholderTitle)
        placeholderView.addSubview(placeholderDescription)

        placeholderTitle.topAnchor.constraint(equalTo: placeholderView.topAnchor).isActive = true
        placeholderTitle.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor).isActive = true
        placeholderTitle.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor).isActive = true

        placeholderDescription.topAnchor.constraint(equalTo: placeholderTitle.bottomAnchor, constant: 8).isActive = true
        placeholderDescription.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor).isActive = true
        placeholderDescription.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor).isActive = true
        placeholderDescription.bottomAnchor.constraint(equalTo: placeholderView.bottomAnchor).isActive = true
    }
}
