import Foundation

struct Car: Decodable{
    let name: String
    let id: String
    
    enum CodingKeys: String, CodingKey{
        case name = "nome"
        case id = "codigo"
    }
}
