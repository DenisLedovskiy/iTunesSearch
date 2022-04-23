//
//  SearchMusicPresenterVIPER.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 22.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SearchMusicPresenterVIPER {

    weak var viewInput: (UIViewController & SearchViewInput)?

    let interactor: SearchInteractorInput
    let router: SearchRouterInput

    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    private func requestMusic(with query: String) {

        self.interactor.requestSong(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
}

extension SearchMusicPresenterVIPER: SearchViewOutput {

    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestMusic(with: query)
    }
}


