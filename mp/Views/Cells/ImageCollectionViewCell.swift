//
//  ImageCollectionViewCell.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 27.05.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    var previewView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.allowsEdgeAntialiasing = true
        view.contentMode = .scaleAspectFit
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setupViews() {
        contentView.addSubview(previewView)

        previewView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        previewView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        previewView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        previewView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
