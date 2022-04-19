//
//  AppVersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 15.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class AppVersionView: UIView {

    // MARK: - Subviews

    private(set) lazy var titleLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Что нового?"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()

    private(set) lazy var versionLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        return label
    }()

    private(set) lazy var descriptionLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }

    // MARK: - UI

    private func setupLayout() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.descriptionLabel)

        NSLayoutConstraint.activate([

            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8.0),

            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8.0),
            self.versionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8.0),

            self.descriptionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 8.0),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8.0),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 8.0)
        ])
    }



}
