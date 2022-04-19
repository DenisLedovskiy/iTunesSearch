//
//  SearchProtocol.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 18.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

protocol SearchViewInput: class {

    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)

}

protocol SearchViewOutput: class {

    func viewDidSearch(with query: String)
//    func viewDidSelectApp(_ app: ITunesSong)

}
