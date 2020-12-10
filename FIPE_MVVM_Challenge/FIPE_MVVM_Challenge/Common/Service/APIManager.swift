import Foundation
import UIKit
import Alamofire

class APIManager{
    
    var detail: Detail?
    var arrayData = [Car]()
    var baseUrl = Environment.baseUrl
    
    func load(path: String, onComplete: @escaping (Bool) -> Void) {
        AF.request("\(baseUrl)/\(path)").responseJSON { response in
            if let json = response.value as? [[String: Any]] {
                var brands = [Car]()
                for item in json {
                    brands.append(Car(fromDictionary: item))
                }
                self.arrayData = brands
                onComplete(true)
                return
            }
            onComplete(false)
        }
    }
    
    func loadModel(path: String, onComplete: @escaping (Bool) -> Void) {
        AF.request("\(baseUrl)/\(path)").responseJSON { response in
            if let json = response.value as? [String: Any], let jsonModels = json["modelos"] as? [[String: Any]] {
                var models = [Car]()
                for item in jsonModels {
                    models.append(Car(fromDictionary: item))
                }
                self.arrayData = models
                onComplete(true)
                return
            }
            onComplete(false)
        }
    }
    
    func loadDetail(path: String, onComplete: @escaping (Bool) -> Void) {
        AF.request("\(baseUrl)/\(path)").responseJSON { response in
            if let json = response.value as? [String: Any]{
                print(json)
                let carDetail = Details(fromDictionary: json)
                
                self.carDetail = carDetail
                onComplete(true)
                return
            }
            onComplete(false)
        }
    }
}
