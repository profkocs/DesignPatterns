protocol Vehicle{
    func deliver(product:String)
}

class Ship:Vehicle{
    
    func deliver(product:String){
        
        // Taşıma işlemleri burada yapılıyor.
    }
    
}
class Truck:Vehicle{
    
    func deliver(product:String){
        
        // Taşıma işlemleri burada yapılıyor.
    }
    
}

protocol Transport{
    
    func setDelivery(product:String)
    func createVehicle() -> Vehicle
    
}

class Road:Transport{
    
    func setDeliver(product: String) {
        
        let truck = createVehicle()
        truck.deliver(product: product)
        
    }
    
    func createVehicle() -> Vehicle {
        
        return Truck()
    }
    
}
class Sea:Transport{
    
    func setDeliver(product: String) {
        
        let ship = createVehicle()
        ship.deliver(product: product)
        
    }
    
    func createVehicle() -> Vehicle {
        
        return Ship()
    }
    
}


class LogisticApp{
    
    init(){
        
        let road = Road()
        road.setDelivery(product: "Vaccine")
        
        let sea = Sea()
        sea.setDelivery(product: "Heavy objects")
        
    }
    
    
}