//
//  ViewController+TableView.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getDoneQuests().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text =
        return cell
    }
    
    
}
