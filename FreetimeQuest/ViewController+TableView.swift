//
//  ViewController+TableView.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(getDoneQuestsFilteredByTime().count)
        return getDoneQuestsFilteredByTime().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let quest = getDoneQuestsFilteredByTime()[indexPath.row]
        cell.textLabel?.text = quest.title
        
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        let date = Date(timeIntervalSince1970: quest.date)
        let strDate = df.string(from: date)

        cell.textLabel?.text = quest.title + strDate
        print(quest.title + strDate)

        return cell
    }
    
    
}
