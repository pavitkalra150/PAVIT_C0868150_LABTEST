//
//  ViewController.swift
//  PAVIT_C0868150_LABTEST
//
//  Created by PAVIT KALRA on 2022-11-04.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var stopwatchLabel: UILabel!
    @IBOutlet weak var lapsTableView: UITableView!
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var lapresetButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startstop(_ sender: UIButton) {
    }
    
    @IBAction func lapReset(_ sender: UIButton) {
    }
    
    
    
    
    
    
    //table
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        cell.backgroundColor = .black
        cell.textLabel?.text = "Lap"
        cell.detailTextLabel?.text = "00:00:00"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

