//
//  QuestCell.swift
//  FreetimeQuest
//
//  Created by Igor Yaskin on 20.02.2021.
//

import UIKit

class QuestCell: SwipeTableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let nibName = "QuestCell"
    static let reuseID = "QuestCell"
    
    var quest: QuestObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imgView.image = nil
        quest = nil
    }
    
    func configureUI() {
        delegate = self
//        selectionStyle = .none
//        backgroundColor = .clear
        bgView.layer.cornerRadius = 10
    }
    
    func configureWithQuest(_ quest: QuestObject) {
        self.quest = quest
        
        titleLabel.text = quest.title
    }
    
}

extension QuestCell: SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath,
                   for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let doneAction = SwipeAction(style: .default, title: nil) { action, indexPath in
            print("done")
            self.showAlert(title: "Выполнить квест?",
                           message: nil,
                           okButtonTitle: "Выполнить",
                           okAction: {_ in
                            print("выполнить квест = \(self.quest?.title)")
                            tableView.hideSwipeCell()
                           },
                           cancelButtonTitle: "Отмена") {_ in
                print("отмена выполнения квест = \(self.quest?.title)")
                tableView.hideSwipeCell()
            }
        }

        let deleteAction = SwipeAction(style: .default, title: nil) { action, indexPath in
            self.showAlert(title: "Удалить квест?",
                           message: nil,
                           okButtonTitle: "Удалить",
                           okAction: {_ in
                            print("удалить квест = \(self.quest?.title)")
                            tableView.hideSwipeCell()
                           },
                           cancelButtonTitle: "Отмена") {_ in
                print("отмена удаления квест = \(self.quest?.title)")
                tableView.hideSwipeCell()
            }
        }

        doneAction.image = UIImage(named: "done")
        deleteAction.image = UIImage(named: "delete")

        return [deleteAction, doneAction]

    }
    
//    func tableView(_ tableView: UITableView,
//                   editActionsOptionsForRowAt indexPath: IndexPath,
//                   for orientation: SwipeActionsOrientation) -> SwipeOptions {
//        var options = SwipeOptions()
//        options.expansionStyle = .destructive
//        options.transitionStyle = .border
//        return options
//    }
    
}


