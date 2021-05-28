//
//  DescriptionView.swift
//  mp
//
//  Created by Nurgun Nalyiakhov on 27.05.2021.
//

import UIKit

class DescriptionView: UIView {
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .regular16
        label.textColor = .text
        return label
    }()

    var valueLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .regular16
        label.textColor = .text
        return label
    }()

    var separator: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.1
        return view
    }()

    init(name: String, value: String, separatorHidden: Bool = false) {
        super.init(frame:CGRect())
        
        self.translatesAutoresizingMaskIntoConstraints = false
        separator.isHidden = separatorHidden
        nameLabel.text = name
        valueLabel.text = value

        setupViews()
    }

    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
    }

    fileprivate func setupViews() {
        addSubview(nameLabel)
        addSubview(valueLabel)
        addSubview(separator)
        
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        
        valueLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
