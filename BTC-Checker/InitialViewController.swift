//
//  InitialViewController.swift
//  BTC-Checker
//
//  Created by Ada 2018 on 21/09/2018.
//  Copyright © 2018 tavaboy+daniboy. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var data: Dictionary<String,Coin>?
    var filteredData: Dictionary<String,Coin>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "BTC Checker"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        RestMan.shared.get(url: "https://blockchain.info/ticker", type: Dictionary<String,Coin>.self) { (coin, error) in
            DispatchQueue.main.async {
                self.data = coin!
                self.tableView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }

}

extension InitialViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CoinTableViewCell
        if let cellData = data {
            let array = Array(cellData.keys)
            if let actualCoin = cellData[array[indexPath.row]]{
                cell.coinLabel.text = "\(array[indexPath.row]) : \(actualCoin.symbol)"
                cell.buyLabel.text = "Buy Value: \(actualCoin.buy)"
                cell.sellLabel.text = "Sell Value : \(actualCoin.sell)"
            }
//            cell?.textLabel?.text = "\(array[indexPath.row]):\(cellData[array[indexPath.row]]!.symbol) -> buy:\(cellData[array[indexPath.row]]!.buy) sell:\(cellData[array[indexPath.row]]!.sell)"
        }
        return cell
    }
    
}
