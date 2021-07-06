protocol Engine{
    
    func start()
    func stop()
    func gas()
}

class LPGEngine:Engine{
    
    func start() {
        // motoru çalıştır.
    }
    
    func stop() {
        // motoru durdur.
    }
    
    func gas(){
        // gaz ver.
    }
    
}

class DieselEngine:Engine{
    
    func start() {
        // motoru çalıştır.
    }
    
    func stop() {
        // motoru durdur.
    }
    
    func gas(){
        // gaz ver.
    }
    
}

class Computer{
    
    func setAirCondition(status:Bool){
        
        if(status){
            
            // Klimayı aç.
        } else {
            
            // Klimayı kapat.
        }
        
    }
}

class Car{
    
    var engine:Engine?
    var computer:Computer?
    var seats:Int = 0
    
    func turnOn() {
        
        engine?.start()
    }
    
    func turnOff() {
        
        engine?.stop()
    }
    
    func forward() {
        
        engine?.gas()
    }
    
    func turnOnAirConditioner() {

        if(computer!= nil){

            computer?.setAirCondition(status: true)
            return
        }
        print("Aracınız bu özelliği desteklemiyor.")
        
    }
    
    func turnOffAirConditioner() {
        
        if(computer != nil){
            computer?.setAirCondition(status: false)
            return
        }
        print("Aracınız bu özelliği desteklemiyor.")
        
    }
    
    func turnOnMusic(musicName:String, status:Bool) {
        
        if(computer != nil){
            computer?.setMusic(name: musicName , status: status)
            return
        }
        print("Aracınız bu özelliği desteklemiyor.")    
    }
    
    func turnOffMusic(musicName:String, status:Bool) {
        
        if(computer != nil){
            computer?.setMusic(name: musicName, status: status)
            return
        }
        print("Aracınız bu özelliği desteklemiyor.") 
    }
    
}


protocol Builder{
    
    func setEngine(engine:Engine)
    func setSeats(number:Int)
    func setComputer()
    func getCar()->Car
    
}

class CarBuilder:Builder{
    
    private var car:Car?

    func setCar(car:Car){
        
        self.car = car
    }
    
    func setEngine(engine: Engine) {
        
        car!.engine = engine
    }
    
    func setSeats(number: Int) {
        
        car!.seats = number
    }
    
    func setComputer() {
        
        car!.computer = Computer()
    }
    
    func getCar() -> Car {
        
        return car!
    }
}

class CarDirector{
    
    private var builder:CarBuilder
    
    init(builder:CarBuilder){
        
        self.builder = builder
    }
    
    func makeSportCar(){
        
        builder.setCar(car: getSportCar())
        builder.setEngine(engine: getDieselEngine())
        builder.setComputer()
        builder.setSeats(number: 2)
        
    }
    
    private func getSportCar()->Car{
        
        return Sport()
    }
    
    private func getDieselEngine()->Engine{
        
        return DieselEngine()
    }
}

class Main{
    
    init(){
        
        
        let builder = CarBuilder()
        
        let sportCarDirector = CarDirector(builder: builder)
        
        sportCarDirector.makeSportCar()
        
        var car = builder.getCar()
        
        car.turnOn()
    
    } 
}
