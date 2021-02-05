//
//  ViewController+CollectionView.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 31.01.2021.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(getDoneQuestsFilteredByTime().count)
        return getDoneQuestsFilteredByTime().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        let quest = getDoneQuestsFilteredByTime()[indexPath.row]
        cell.titleLabel.text = quest.title
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        let date = Date(timeIntervalSince1970: quest.date)
        let strDate = df.string(from: date)
        
        cell.dateLabel.text = strDate
        
        print(quest.title + strDate)
        
        return cell

    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

}
