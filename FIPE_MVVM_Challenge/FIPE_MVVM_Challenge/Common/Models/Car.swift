import Foundation

class Car: NSObject{
    var name: String!
    var id: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        id = dictionary["codigo"] as? String
        name = dictionary["nome"] as? String
        
        if id == nil {
            if let intId = dictionary["codigo"] as? Int {
                id = "\(intId)"
            }
        }
    }
}
