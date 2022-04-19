//
//  MusicCell.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 18.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class MusicCell: UITableViewCell {

    // MARK: - Subviews

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()

    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()

    private(set) lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    // MARK: - Methods

    func configure(with cellModel: MusicCellModel) {
        self.titleLabel.text = cellModel.title
        self.artistLabel.text = cellModel.artist
        self.albumLabel.text = cellModel.album
    }

    // MARK: - UI

    override func prepareForReuse() {
        [self.titleLabel, self.artistLabel, self.albumLabel].forEach { $0.text = nil }
    }

    private func configureUI() {
        self.addTitleLabel()
        self.addSubtitleLabel()
        self.addRatingLabel()
    }

    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }

    private func addSubtitleLabel() {
        self.contentView.addSubview(self.artistLabel)
        NSLayoutConstraint.activate([
            self.artistLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.artistLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.artistLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }

    private func addRatingLabel() {
        self.contentView.addSubview(self.albumLabel)
        NSLayoutConstraint.activate([
            self.albumLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 4.0),
            self.albumLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.albumLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
}
