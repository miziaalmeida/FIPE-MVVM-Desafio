import UIKit
import Alamofire

class BrandsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = BrandsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.getBrand { sucess in
            if sucess {
                self.tableView.reloadData()
            }
        }
    }
}

extension BrandsViewController: UITableViewDelegate{
    
}

extension BrandsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getArrayBrands().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getNameBrands(i: indexPath.row)
        
        return cell
    }
}
