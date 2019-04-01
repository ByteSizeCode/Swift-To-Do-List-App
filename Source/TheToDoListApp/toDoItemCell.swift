//
//  ShareCell.swift
//  DynamicFlowLayoutDemo
//
//  Based on VegaScroll.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit

class toDoItemCell: UICollectionViewCell {
    
    static let sharedInstance = toDoItemCell()

    @IBOutlet private weak var taskNameLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var finishedStatusLabel: UILabel!

    @IBOutlet weak var completionStatusIcon: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		categoryLabel.textColor = UIColor.vegaGray
		layer.cornerRadius = 14
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.3
		layer.shadowOffset = CGSize(width: 0, height: 5)
		layer.masksToBounds = false
	}
	
	func configureWith(_ task: toDoItem) {
		taskNameLabel.text = task.taskName
		categoryLabel.text = task.category
		dateLabel.text = "\(task.date))"
		finishedStatusLabel.text = " Not Done"
        
        //Change image to done (checkmark) image or not done image
        if task.isDone {
            dateLabel.textColor = UIColor.vegaGray
            finishedStatusLabel.textColor = UIColor.vegaGray
            finishedStatusLabel.text = "Done"
            completionStatusIcon.image = #imageLiteral(resourceName: "done")
            
        } else {
            finishedStatusLabel.textColor = task.isDone ? UIColor.vegaGreen : UIColor.vegaRed
            dateLabel.textColor = UIColor.vegaBlack
            completionStatusIcon.image = task.isDone ? #imageLiteral(resourceName: "done") : #imageLiteral(resourceName: "not_done")
        }
	}
	
	private func twoDigitsFormatted(_ val: Double) -> String {
		return String(format: "%.0.2f", val)
	}
}
