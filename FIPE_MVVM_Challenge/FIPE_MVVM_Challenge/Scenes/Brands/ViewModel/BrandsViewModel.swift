import Foundation
import UIKit

class BrandsViewModel{
    
    var api = APIManager()
    var arrayBrands = [Car]()
    
    func getBrand (onComplete: @escaping (Bool) -> Void) {
        api.load(path: "carros/marcas") { sucess in
            self.arrayBrands = self.api.arrayData
            onComplete(true)
            return
        }
        onComplete(false)
        return
    }
    
    func getArrayBrands() -> [Car]{
        return arrayBrands
    }
    
    func getNameBrands(i: Int) -> String {
        return arrayBrands[i].name
    }
    
    func getIdBrands(i: Int) -> String{
        return arrayBrands[i].id
    }
    
    func openModal(storyboard: String, nameViewController: UIViewController){
        
    }
    
}
