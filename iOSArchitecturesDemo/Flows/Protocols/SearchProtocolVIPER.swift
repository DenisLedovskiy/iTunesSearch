//
//  SearchProtocolVIPER.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 22.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchRouterInput {
    
    func openDetails(for app: ITunesSong)
    func openAppInITunes(_ app: ITunesSong)
}

protocol SearchInteractorInput {

    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)

}

