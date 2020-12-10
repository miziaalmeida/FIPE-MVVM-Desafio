import Foundation

class YearViewModel {
    var idBrand: String?
    var idModel: String?
    var api = APIManager()
    var arrayYears = [Car]()
    
    func getYearModel (onComplete: @escaping (Bool) -> Void) {
        if let id = idBrand, let model = idModel {
            api.load(path: "carros/marcas/\(id)/modelos/\(model)/anos") {sucess in
                self.arrayYears = self.api.arrayData
                onComplete(true)
                return
            }
            onComplete(false)
            return
        }
    }
    
    func getArrayYear() -> [Car]{
        return arrayYears
    }
    
    func getYear(i: Int) -> String {
        return arrayYears[i].name
    }
    
    func getId(i: Int) -> String{
        return arrayYears[i].id
    }
    
}

