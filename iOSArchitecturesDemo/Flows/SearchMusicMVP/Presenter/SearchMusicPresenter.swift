//
//  SearchMusicPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 18.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SearchMusicPresenter {

    weak var viewInput: (UIViewController & SearchViewInput)?

    private let searchService = ITunesSearchService()

    private func requestMusic(with query: String) {

        self.searchService.getSongs(forQuery: query) { [weak self] result in
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

extension SearchMusicPresenter: SearchViewOutput {

    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestMusic(with: query)
    }
}


