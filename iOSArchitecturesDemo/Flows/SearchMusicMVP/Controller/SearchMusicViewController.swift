//
//  SearchMusicViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Ледовский on 14.04.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SearchMusicViewController: UIViewController {

    // MARK: - Private Properties

    private var searchView: SearchMusicView {
        return self.view as! SearchMusicView
    }

    private let searchService = ITunesSearchService()

//    private var searchResults = [ITunesSong]()

    var searchResults = [ITunesSong]() {
        didSet {
            self.searchView.tableView.isHidden = false
            self.searchView.tableView.reloadData()
            self.searchView.searchBar.resignFirstResponder()
        }
    }

    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }

    private let presenter: SearchViewOutput

    init(presenter: SearchViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()
        self.view = SearchMusicView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(MusicCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }

    // MARK: - Private

//    private func throbber(show: Bool) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = show
//    }
//
//    private func showError(error: Error) {
//        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
//        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alert.addAction(actionOk)
//        self.present(alert, animated: true, completion: nil)
//    }

//    private func showNoResults() {
//        self.searchView.emptyResultView.isHidden = false
//    }
//
//    private func hideNoResults() {
//        self.searchView.emptyResultView.isHidden = true
//    }
//
//    private func requestMusic(with query: String) {
//        self.throbber(show: true)
//        self.searchResults = []
//        self.searchView.tableView.reloadData()
//
//        self.searchService.getSongs(forQuery: query) { [weak self] result in
//            guard let self = self else { return }
//            self.throbber(show: false)
//            result
//                .withValue { apps in
//                    guard !apps.isEmpty else {
//                        self.searchResults = []
//                        self.showNoResults()
//                        return
//                    }
//                    self.hideNoResults()
//                    self.searchResults = apps
//
//                    self.searchView.tableView.isHidden = false
//                    self.searchView.tableView.reloadData()
//
//                    self.searchView.searchBar.resignFirstResponder()
//                }
//                .withError {
//                    self.showError(error: $0)
//                }
//        }
//    }
}

//MARK: - UITableViewDataSource
extension SearchMusicViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? MusicCell else {
            return dequeuedCell
        }
        let app = self.searchResults[indexPath.row]
        let cellModel = MusicCellModelFactory.cellModel(from: app)
        cell.configure(with: cellModel)
        return cell
    }
}

//MARK: - UISearchBarDelegate
extension SearchMusicViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
//        self.requestMusic(with: query)
        self.presenter.viewDidSearch(with: query)
    }
}

// MARK: - Input

extension SearchMusicViewController: SearchViewInput {

    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message:"\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }

    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
        self.searchResults = []
        self.searchView.tableView.reloadData()
    }

    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }

    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }

}
