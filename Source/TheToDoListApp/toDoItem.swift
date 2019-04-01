//
//  Share.swift
//  DynamicFlowLayoutDemo
//
//  Based on VegaScroll.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import Foundation

struct toDoItem: Hashable {
    var taskName: String
    let category: String
    let date: Date
    var finishedStatus: String
//    let percent: Double
    var isDone: Bool
//    var isClosed: Bool = false
	
    init(name: String, category: String, date: Date, finishedStatus: String, isDone: Bool) {
		self.taskName = name
		self.category = category
		self.date = date
        self.finishedStatus = finishedStatus
//        self.percent = percent
        self.isDone = isDone
//        self.isClosed = isClosed
	}
}
