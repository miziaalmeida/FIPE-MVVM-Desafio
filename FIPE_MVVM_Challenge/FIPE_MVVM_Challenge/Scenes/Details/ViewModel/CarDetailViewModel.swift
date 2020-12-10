import Foundation

class CarDetailViewModel{
    
    var idBrand: String?
    var idModel: String?
    var idYear: String?
    
    var api = APIManager()
    var carDetail: CarDetail?
    
    func getDetail(onComplete: @escaping(Bool) -> Void){
        if let id = idBrand, let model = idModel, let year = idYear{
            api.loadCarDetail(path: "carros/marcas/\(id)/modelos/\(model)/anos/\(year)") {sucess in
                self.carDetail = self.api.carDetail
                onComplete(true)
                return
            }
            onComplete(false)
            return
        }
        
    }
    
    func getBrand() -> String {
        return "Marca: \((carDetail?.marca)!)"
    }
    
    func getModel() -> String {
        return "Modelo: \((carDetail?.modelo)!)"
    }
    
    func getYear() -> String {
        return String("Ano: \((carDetail?.anoModelo)!)")
    }
    
    func getPrice() -> String {
        return "Valor R$: \((carDetail?.valor)!)"
    }
}
