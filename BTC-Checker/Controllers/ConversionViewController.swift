//
//  ConversionViewController.swift
//  BTC-Checker
//
//  Created by Daneil S A B on 22/10/18.
//  Copyright © 2018 tavaboy+daniboy. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Convert Coins"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .bookmarks, target: self, action: #selector(presentCoinsViewController))
    }

    @objc func presentCoinsViewController() {
        self.navigationController?.pushViewController(CoinsViewController(), animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
