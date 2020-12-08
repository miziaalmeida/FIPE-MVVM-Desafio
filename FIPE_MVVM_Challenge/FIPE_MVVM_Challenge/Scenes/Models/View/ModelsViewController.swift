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
