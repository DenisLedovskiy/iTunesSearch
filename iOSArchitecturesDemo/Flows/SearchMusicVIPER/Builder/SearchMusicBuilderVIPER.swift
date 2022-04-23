//
//  SearchMusicBuilderVIPER.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 22.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilderVIPER {

    static func build() -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchMusicPresenterVIPER(interactor: interactor, router: router)
        let viewController = SearchMusicVIPERVC(presenter: presenter)

        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
}
