//
//  MusicCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 18.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

struct MusicCellModel {
    let title: String
    let artist: String?
    let album: String?
}

final class MusicCellModelFactory {

    static func cellModel(from model: ITunesSong) -> MusicCellModel {
        return MusicCellModel(title: model.trackName,
                              artist: model.artistName,
                              album: model.collectionName)
    }
}
