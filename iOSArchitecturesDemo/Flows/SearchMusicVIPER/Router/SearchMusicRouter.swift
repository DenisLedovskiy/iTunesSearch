//
//  SearchMusicRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 22.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

//MARK: - Не делал экран подробной информации для музыки. Соотвественно некуда переходить.

final class SearchRouter: SearchRouterInput {
    
    func openDetails(for app: ITunesSong) {
        print("1")
    }

    func openAppInITunes(_ app: ITunesSong) {
        print("2")
    }


    weak var viewController: UIViewController?
//
//    func openDetails(for app: ITunesSong) {
//        let appDetaillViewController = AppDetailViewController(app: app)
//        self.viewController?.navigationController?.pushViewController(appDetaillViewCont roller, animated: true)
//    }
//
//    func openAppInITunes(_ app: ITunesApp) {
//        guard let urlString = app.appUrl,
//              let url = URL(string: urlString) else { return }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
}
