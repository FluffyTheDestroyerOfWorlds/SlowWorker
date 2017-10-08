//
//  ViewController.swift
//  SlowWorker
//
//  Created by David Boesen on 10/7/17.
//  Copyright © 2017 David Boesen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	
		@IBOutlet var startButton: UIButton!
		@IBOutlet var resultsTextView: UITextView!
	
	func fetchSomethingFromServer() -> String {
			Thread.sleep(forTimeInterval: 1)
			return "Hi there"
		}
	
	func processData(data: String) -> String {
			Thread.sleep(forTimeInterval: 2)
			return data.uppercased()
		}
	
	func calculateFirstResult(data: String) -> String {
		Thread.sleep(forTimeInterval: 3)
		return "Number of chars: \(data.characters.count)"
	}
	
	func calculateSecondResult(data: String) -> String {
		Thread.sleep(forTimeInterval: 4)
		return data.replacingOccurrences(of: "E", with: "e")
	}
	
	@IBAction func doWork(sender: AnyObject) {
		let startTime = NSDate()
		self.resultsTextView.text = ""
		let fetchedData = self.fetchSomethingFromServer()
		let processedData = self.processData(data: fetchedData)
		let firstResult = self.calculateFirstResult(data: processedData)
		let secondResult = self.calculateSecondResult(data: processedData)
		let resultsSummary =
		"First: [\(firstResult)]\nSecond: [\(secondResult)]"
		self.resultsTextView.text = resultsSummary
		let endTime = NSDate()
		print("Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

