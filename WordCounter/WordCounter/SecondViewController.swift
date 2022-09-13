//
//  SecondViewController.swift
//  WordCounter
//
//  Created by PAULO ALMEIDA on 13/09/2022.
//

import UIKit

class SecondViewController: UIViewController{

    var finalWordsArray: [Words] = []
    
    @IBOutlet var resultsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTable.delegate = self
        resultsTable.dataSource = self
    }
    
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalWordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(finalWordsArray[indexPath.row].word)"
        cell.detailTextLabel?.text = "\(finalWordsArray[indexPath.row].frequency)"

        return cell
    }
    
}
