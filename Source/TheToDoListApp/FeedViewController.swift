//
//  ViewController.swift
//  VegaScrollFlowLayout
//
//  Based on VegaScroll.
//  Copyright © 2019 Isaac Raval. All rights reserved.


import UIKit

// MARK: - Configurable constants
private let itemHeight: CGFloat = 84
private let lineSpacing: CGFloat = 20
private let xInset: CGFloat = 20
private let topInset: CGFloat = 10

class FeedViewController: UIViewController {

    //Singleton to make properties and methods accessible from other files
    static let sharedInstance = FeedViewController()
    
    //Struct allows ability to use between files
    public struct publicVars {
        static var taskNameValue:String = "";
        static var taskCatagoryValue:String = "";
    }
    
	fileprivate let cellId = "ShareCell"
	@IBOutlet private weak var collectionView: UICollectionView!
    
    //Struct allows ability to use between files
    public struct vars {
        static var tasks: [toDoItem] = []
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
        var nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register( nib, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset.bottom = itemHeight
        configureCollectionViewLayout()
        setUpNavBar()
        
        //Add observers to wath for app entering background and entering foreground and call respective functions on occurence
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: nil)
        notificationCenter.addObserver(self, selector: #selector(applicationWillEnterForeground(_:)), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
	}
	
	private func setUpNavBar() {
		navigationItem.title = "Feed"
		navigationController?.view.backgroundColor = UIColor.white
		if #available(iOS 11.0, *) {
			navigationController?.navigationBar.prefersLargeTitles = true
		}
	}
	
	private func configureCollectionViewLayout() {
		guard let layout = collectionView.collectionViewLayout as? VegaScrollFlowLayout else { return }
		layout.minimumLineSpacing = lineSpacing
		layout.sectionInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
		let itemWidth = UIScreen.main.bounds.width - 2 * xInset
		layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
		collectionView.collectionViewLayout.invalidateLayout()
	}
    
    //Reload cells when coming back from TaskEntryViewController
    override func viewDidAppear(_ animated: Bool) {
        //Refresh/update collectionView when coming back from another view controller (e.g. when adding a task from the '+' button)
        collectionView.reloadData()
    }
    
    //Detect when user taps on a cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("Tapped Cell")
        var tappedTask = FeedViewController.vars.tasks[indexPath.row]
        let tappedTaskArchiveObjectBeforeChanging = tappedTask //make a copy before mutating (for comparison)
        
        //If user taps cell- mark done, if tapped again- unmark as done
        if(tappedTask.isDone == false) {
            tappedTask.isDone = true
            tappedTask.finishedStatus = "Done"
        }
        else {
            tappedTask.isDone = false
        }
        
        //Delete old object (task) from array
        while let indexRemovedAt = FeedViewController.vars.tasks.index(of:tappedTaskArchiveObjectBeforeChanging) {
            FeedViewController.vars.tasks.remove(at: indexRemovedAt)

        //Append updated object to array of objects (tasks) at exact index it was removed from (so cell location is preserved)
        FeedViewController.vars.tasks.insert(tappedTask, at: indexRemovedAt)
            
        //Refresh/update collectionView
        collectionView.reloadData()
        }
    }
    
    @objc func applicationWillResignActive(_ application: UIApplication) {
        
        print("entering background")
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.medium
        dateformatter.timeStyle = DateFormatter.Style.short
        
        //Convrert array of objects (tasks) to string for ease of storing
        var tasksArrayConvToStr = ""
            for index in 0 ..< FeedViewController.vars.tasks.count {
                
                tasksArrayConvToStr +=  FeedViewController.vars.tasks[index].taskName + ", "
                
                tasksArrayConvToStr +=  FeedViewController.vars.tasks[index].category + ", "
                
                tasksArrayConvToStr +=  "\(FeedViewController.vars.tasks[index].date), "
                
                tasksArrayConvToStr +=  FeedViewController.vars.tasks[index].finishedStatus + ", "
                
                tasksArrayConvToStr +=  "\(FeedViewController.vars.tasks[index].isDone), "
                
                if(index != FeedViewController.vars.tasks.count - 1) {
                    tasksArrayConvToStr += "newobjectfollows, "
                }
                else {
                    tasksArrayConvToStr += "newobjectfollows"
                }
            }
        
        print("Storing \(tasksArrayConvToStr)")
        
        //Store array of objects (tasks) converted to string above to userdefaults
        let prefs = UserDefaults.standard
        prefs.set(tasksArrayConvToStr, forKey: "1")
    }
    
    @objc func applicationWillEnterForeground(_ application: UIApplication) {
        print("entering foreground")
        
        //Calculate date
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.medium
        dateformatter.timeStyle = DateFormatter.Style.short
        let now = dateformatter.string(from: Date()) //as string
        //convert to date type
        let strToDateConv = dateformatter.date(from: now)
        
        let prefs = UserDefaults.standard //setup for UserDefaults
        let tasksArrayConvStr = prefs.string(forKey: "1") //Read from UserDefaults
        if(tasksArrayConvStr != nil) {
            var strConvToTasksArrayTemp = [String]() //create empty array to append to, to hold all separate elements as strings
           
            //Separate tasksArrayConvStr into an array of strings separated by commas and store it in strConvToTasksArrayTemp
            strConvToTasksArrayTemp = tasksArrayConvStr!.components(separatedBy: ", ")
            
            //Clear array of objects (tasks)
            FeedViewController.vars.tasks.removeAll()
            
            var numTimesLooped = 0
            //Loop through strConvToTasksArrayTemp string array and separate out properties by object, and then reconstruct the objects from the groups of properties and append the objects to array of objects (tasks)
            for index in 0 ..< (strConvToTasksArrayTemp.count / 6) {
                //Order to parse: taskName, category, date, finishedStatus, isDone, newobjectfollows
                let taskNameLocal = strConvToTasksArrayTemp[index + (5 * numTimesLooped) + 0] as? String
                let categoryLocal = strConvToTasksArrayTemp[index + (5 * numTimesLooped) + 1] as? String
                print((strConvToTasksArrayTemp[index + (5 * numTimesLooped) + 2] as! String))
                let dateLocal = dateformatter.date(from: (strConvToTasksArrayTemp[index + (5 * numTimesLooped) + 2] as! String))
                if(dateLocal == nil) {print("dateLocal is nil")}
                
                let finishedStatusLocal = strConvToTasksArrayTemp[index + (5 * numTimesLooped) + 3] as? String
                var isDoneLocal:Bool = (strConvToTasksArrayTemp[index + (5 * numTimesLooped) + 4] == "true") ? true: false
                let newobjectfollows = strConvToTasksArrayTemp[index + (5 * numTimesLooped) + 5]
                numTimesLooped += 1
                
                //Append object to array of objects (tasks)
                FeedViewController.vars.tasks.append(toDoItem(name: taskNameLocal ?? "error", category: categoryLocal ?? "error", date: dateLocal ?? strToDateConv!, finishedStatus: finishedStatusLocal ?? "error", isDone: isDoneLocal ?? false))
                print("---\(dateLocal)")
            }

            //Reload/update collection view to show latest version of array of objects (tasks)
            collectionView.reloadData()
        }
    }
    @IBAction func removeAllTasksFromCollectionView(_ sender: UIButton) {
        print("Removing all tasks")
        FeedViewController.vars.tasks.removeAll()
        collectionView.reloadData()
    }
}

extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! toDoItemCell
		let task = FeedViewController.vars.tasks[indexPath.row]
		cell.configureWith(task)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return array of objects containing tasks which is named tasks
		return FeedViewController.vars.tasks.count
	}
}
