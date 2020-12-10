import UIKit

class ModelsViewController: UIViewController {
    
    @IBOutlet weak var tableViewModels: UITableView!
    
    var viewModel = ModelsViewModel()
    var idBrand: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewModels.delegate = self
        tableViewModels.dataSource = self
        viewModel.id = idBrand
        
        viewModel.getModel { sucess in
            self.tableViewModels.reloadData()
        }
    }
}

extension ModelsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screenYear = UIStoryboard(name: "Year", bundle: nil).instantiateInitialViewController() as? YearViewController{
            screenYear.idBrand = idBrand
            screenYear.idModel = viewModel.getId(i: indexPath.row)
            navigationController?.pushViewController(screenYear, animated: true)
        }
    }
}

extension ModelsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getArrayModels().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getNameModels(i: indexPath.row)
        
        return cell
    }
}
