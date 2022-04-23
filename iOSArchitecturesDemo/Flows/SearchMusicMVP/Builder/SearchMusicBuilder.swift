//
//  SearchMusicBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 19.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilder {

    static func build() -> (UIViewController & SearchViewInput) {
        let presenter = SearchMusicPresenter()
        let viewController = SearchMusicViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
