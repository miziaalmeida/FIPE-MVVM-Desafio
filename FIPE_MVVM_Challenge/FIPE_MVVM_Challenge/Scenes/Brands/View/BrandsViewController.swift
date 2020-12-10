import UIKit
import Alamofire

class BrandsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = BrandsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor (red: 1.0, green: 1.0, blue: 0.5, alpha: 1.0)
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screenModel = UIStoryboard(name: "Models", bundle: nil).instantiateInitialViewController() as? ModelsViewController{
            
            screenModel.idBrand = viewModel.getIdBrands(i: indexPath.row)
            navigationController?.pushViewController(screenModel, animated: true)
        }
    }
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
