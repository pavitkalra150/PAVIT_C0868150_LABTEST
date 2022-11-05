//
//  ViewController.swift
//  PAVIT_C0868150_LABTEST
//
//  Created by PAVIT KALRA on 2022-11-04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var laps : [String] = []
    var timer: Timer?
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    
    var startStopWatch: Bool = true
    var addLap: Bool = false
    
    var stopWatchString: String = ""
    
    
    @IBOutlet weak var stopwatchLabel: UILabel!
    @IBOutlet weak var lapsTableView: UITableView!
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var lapresetButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stopwatchLabel.text = "00:00:00"
    }


    @IBAction func startstop(_ sender: UIButton) {
        
        if startStopWatch == true{
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in self.updateStopwatch()})
            startStopWatch = false
            startstopButton.setTitle("Stop", for: .normal)
            lapresetButton.setTitle("Lap", for: .normal)
            addLap = true
        }
        else{
            timer?.invalidate()
            startStopWatch = true
            startstopButton.setTitle("Start", for: .normal)
            lapresetButton.setTitle("Reset", for: .normal)
            addLap = false
        }
    }
    
    @IBAction func lapReset(_ sender: UIButton) {
        
        if addLap == true {
            laps.insert(stopWatchString, at: 0)
            lapsTableView.reloadData()
        }
        else {
            addLap = false
            
            laps.removeAll(keepingCapacity: false)
            lapsTableView.reloadData()
            
            fractions = 0
            minutes = 0
            seconds = 0
            stopWatchString = "00:00:00"
            stopwatchLabel.text = stopWatchString
        }
    }
    
    
    
    func updateStopwatch(){
        fractions += 1
        if fractions == 100 {
            seconds += 1
            fractions = 0
        }
        if seconds == 60{
            minutes += 1
            seconds = 0
        }
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopWatchString = "\(minutesString):\(secondsString):\(fractionsString)"
        
        stopwatchLabel.text = stopWatchString
    }
    
    
    //table
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Lap \(laps.count - indexPath.row)"
        cell.detailTextLabel?.text = laps[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    
    
}


