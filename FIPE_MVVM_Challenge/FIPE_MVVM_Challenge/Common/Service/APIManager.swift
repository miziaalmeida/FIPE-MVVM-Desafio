import Foundation
import UIKit

class APIManager: ServiceProtocol{
    func getData(url: URL, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion(.failure(ServiceError.unknown(error)))
                }
            }
            guard let validData = data else{
                DispatchQueue.main.async {
                    completion(.failure(ServiceError.invalidData))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(validData))
            }
        }
        .resume()
    }
    
//    func loadData(path: String, onComplete: @escaping (Bool) -> Void){
//        let session = URLSession.shared
//        let url = URL(string: "https://parallelum.com.br/fipe/api/v1")!
//        let task = session.dataTask(with: url, completionHandler: {data, response, error in
//            print(error!)
//            print(response!)
//            print(data!)
//        })
//        task.resume()
//    }
}

