//
//  CarDetailViewController.swift
//  FIPE_MVVM_Challenge
//
//  Created by Mizia Lima on 12/10/20.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var viewModel = CarDetailViewModel()
    var idBrand: String?
    var idModel: String?
    var idYear: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1.5, green: 1.8, blue: 1.2, alpha: 1.0)
        
        viewModel.idBrand = idBrand
        viewModel.idModel = idModel
        viewModel.idYear = idYear
        
        viewModel.getDetail { sucess in
            if sucess {
                self.configureLabels()
            }
        }
    }
    
    func configureLabels(){
        brandLabel.text = viewModel.getBrand()
        modelLabel.text = viewModel.getModel()
        yearLabel.text = viewModel.getYear()
        priceLabel.text = viewModel.getPrice()
    }
}
