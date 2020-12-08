import Foundation
import UIKit

enum ServiceError: Error {
    case unknown(Error?)
    case invalidData
}

protocol ServiceProtocol {
    func getData(url: URL, completion: @escaping (Result<Data, ServiceError>) -> Void)
}
