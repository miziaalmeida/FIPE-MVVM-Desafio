import Foundation

class ModelsViewModel{
    
    var id: String?
    var api = APIManager()
    var arrayModels = [Car]()
    
    func getModel (onComplete: @escaping (Bool) -> Void) {
        if let id = id {
            api.loadModel(path:"carros/marcas/\(id)/modelos") { sucess in
                self.arrayModels = self.api.arrayData
                onComplete(true)
                return
            }
        }
        onComplete(false)
        return
    }
    
    func getArrayModels() -> [Car]{
        return arrayModels
    }
    
    func getNameModels(i: Int) -> String {
        return arrayModels[i].name
    }
    
    func getId(i: Int) -> String{
        return arrayModels[i].id
    }
    
}
