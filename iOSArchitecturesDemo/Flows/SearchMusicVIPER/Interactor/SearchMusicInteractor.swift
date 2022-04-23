//
//  SearchMusicInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 22.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import Alamofire

final class SearchInteractor: SearchInteractorInput {

    private let searchService = ITunesSearchService()

    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {

        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
