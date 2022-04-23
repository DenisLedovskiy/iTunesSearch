//
//  AppVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 15.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class AppVersionViewController: UIViewController {

    // MARK: - Properties

    private let app: ITunesApp
    private let imageDownloader = ImageDownloader()
    private var appVersionView: AppVersionView {
        return self.view as! AppVersionView
    }

    // MARK: - Init

    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil) }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        self.view = AppVersionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }

    // MARK: - Private

    private func fillData() {
        self.appVersionView.versionLabel.text = app.version
        self.appVersionView.descriptionLabel.text = app.releaseNotes
    }

}
