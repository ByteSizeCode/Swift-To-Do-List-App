//
//  CellsManager.swift
//  DynamicFlowLayout
//
//  Based on VegaScroll.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import Foundation

//Store to-do items
//var toDoItemsAsObjects: [toDoItem] = [toDoItem(name: "9", category: "9", date: Date(), finishedStatus: "", isDone: false)]

class CellsManager {

    static func populateTasks() -> [toDoItem] {
        //return items stored
        return FeedViewController.vars.tasks;
//        return [
//        toDoItem(name: "Apple", category: "technology", price: 768.5, score: 1.43, percent: 0.123, isGrowing: true),
//            toDoItem(name: "Facebook", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true, isClosed: true),
//            toDoItem(name: "Twitter", category: "technology", price: 766.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Tinder", category: "technology", price: 568.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Foursquare", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "GMC", category: "automobile", price: 468.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "BMW", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Nissan", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Ferrari", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Samsung", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "LG", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Xiaomi", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Google", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Apple", category: "technology", price: 768.5, score: 1.43, percent: 0.123, isGrowing: true),
//            toDoItem(name: "Facebook", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true, isClosed: true),
//            toDoItem(name: "Twitter", category: "technology", price: 766.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Tinder", category: "technology", price: 568.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Foursquare", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "GMC", category: "automobile", price: 468.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "BMW", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Nissan", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Ferrari", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Samsung", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "LG", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Xiaomi", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Google", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Apple", category: "technology", price: 768.5, score: 1.43, percent: 0.123, isGrowing: true),
//            toDoItem(name: "Facebook", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Twitter", category: "technology", price: 766.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Tinder", category: "technology", price: 568.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Foursquare", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "GMC", category: "automobile", price: 468.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "BMW", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Nissan", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Ferrari", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Samsung", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "LG", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Xiaomi", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Google", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Apple", category: "technology", price: 768.5, score: 1.43, percent: 0.123, isGrowing: true),
//            toDoItem(name: "Facebook", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Twitter", category: "technology", price: 766.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Tinder", category: "technology", price: 568.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Foursquare", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "GMC", category: "automobile", price: 468.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "BMW", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Nissan", category: "automobile", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Ferrari", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Samsung", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "LG", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false),
//            toDoItem(name: "Xiaomi", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: true),
//            toDoItem(name: "Google", category: "technology", price: 768.5, score: 1.43, percent: 0.34, isGrowing: false)
//        ]
    }
}
