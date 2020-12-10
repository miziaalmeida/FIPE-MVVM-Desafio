import Foundation

class DetailsViewModel {
    var idBrand: String?
    var idModel: String?
    var idYear: String?
    var api = APIManager()
    var carDetail: Details?
    
    func getDetailCar(onComplete: @escaping (Bool) -> Void) {
        if let id = idBrand, let model = idModel, let year = idYear{
            api.loadDetail(path: "carros/marcas/\(id)/modelos/\(model)/anos/\(year)") {sucess in
                self.carDetail = self.api.detail
                onComplete(true)
                return
            }
            onComplete(false)
            return
        }
    }
    
    func getBrand() -> String{
        return "Marca: \(String(describing: carDetail?.marca ?? nil))"
    }
    
    func getModel() -> String{
        return "Modelo: \(String(describing: carDetail?.modelo ?? nil))"
    }
    
    func getYear() -> String {
        return "Ano: \(String(describing: carDetail?.anoModelo ?? nil))"
    }
    
    func getPrice() -> String {
        return "Valor: R$ \(String(describing: carDetail?.valor ?? nil))"
    }
}

