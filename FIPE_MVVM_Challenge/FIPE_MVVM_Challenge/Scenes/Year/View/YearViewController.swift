import UIKit

class YearViewController: UIViewController {
    
    @IBOutlet weak var tableViewYear: UITableView!
    
    var viewModel = YearViewModel()
    var idBrand: String?
    var idModel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewYear.delegate = self
        tableViewYear.dataSource = self
        
        viewModel.idBrand = idBrand
        viewModel.idModel = idModel
        
        viewModel.getYearModel { sucess in
            self.tableViewYear.reloadData()
        }
    }
}

extension YearViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screenDetails = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController{
            screenDetails.idBrand = idBrand
            screenDetails.idModel = idModel
            screenDetails.idYear = viewModel.getYear(i: indexPath.row)
            navigationController?.pushViewController(screenDetails, animated: true)
        }
    }
}

extension YearViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getArrayYear().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getYear(i: indexPath.row)
        
        return cell
    }
}
