//
//  BrandsViewController.swift
//  FIPE_MVVM_Challenge
//
//  Created by Mizia Lima on 12/7/20.
//

import UIKit

class BrandsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension BrandsViewController: UITableViewDelegate{
    
}

extension BrandsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

}
