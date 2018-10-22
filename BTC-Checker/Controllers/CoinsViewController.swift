//
//  CoinsViewController.swift
//  BTC-Checker
//
//  Created by Ada 2018 on 21/09/2018.
//  Copyright © 2018 tavaboy+daniboy. All rights reserved.
//

import UIKit

class CoinsViewController: UIViewController {
    
    var data: Dictionary<String,Coin>?
    var filteredData: Dictionary<String,Coin>?
    var indicator = UIActivityIndicatorView()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchBar()
        
        activityIndicator()

        navigationItem.title = "Coins List"
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CoinTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        RestMan.shared.get(url: "https://blockchain.info/ticker", type: Dictionary<String,Coin>.self) { (coin, error) in
            DispatchQueue.main.async {
                self.data = coin!
                self.filteredData = self.data
                self.tableView.reloadData()
                self.indicator.stopAnimating()
            }
        }
    }
    
    // Creating and then Setting a SearchController to show on NavigationController
    func setUpSearchBar() {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        search.searchResultsUpdater = self
//        search.obscuresBackgroundDuringPresentation = false
        search.definesPresentationContext = true
        self.navigationItem.searchController = search
    }
    
    // Creating an activity indicator and show he, when table load.
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.backgroundColor = UIColor.clear
        indicator.center = self.view.center
        self.indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }

}

extension CoinsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CoinTableViewCell
        if let cellData = filteredData {
            let array = Array(cellData.keys)
            if let actualCoin = cellData[array[indexPath.row]]{
                cell.coinLabel.text = "\(array[indexPath.row]) : \(actualCoin.symbol)"
                cell.buyLabel.text = "Buy Value: \(actualCoin.buy)"
                cell.sellLabel.text = "Sell Value : \(actualCoin.sell)"
            }
        }
        return cell
    }
    
}

extension CoinsViewController: UISearchResultsUpdating ,UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredData = data
        } else {
            filteredData = data?.filter({
                $0.key.localizedCaseInsensitiveContains(searchText)
            })
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        filteredData = data
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredData = data
    }
}
