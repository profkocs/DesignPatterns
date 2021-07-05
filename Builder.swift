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
    
    func setMusic(name:String, status:Bool){
        
        if(status){
            
            // Müziği ismi ile bul ve aç.
            
        } else {
            
            // Müziği ismi ile bul ve kapat.
        }
        
    }
    
    
}

protocol Car{
    
    var engine:Engine?{ get set}
    var computer:Computer?{get set}
    var seats:Int{get set}
    
    func turnOn()
    func turnOff()
    func forward()
    func turnOnAirConditioner()
    func turnOffAirConditioner()
    func turnOnMusic(musicName:String, status:Bool)
    func turnOffMusic(musicName:String, status:Bool)
    
}

class Sport:Car{
    
    var engine: Engine?
    
    var computer: Computer?
    
    var seats: Int = 0

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
        
        computer?.setAirCondition(status: true)
    }
    
    func turnOffAirConditioner() {
        
        computer?.setAirCondition(status: false)
    }
    
    func turnOnMusic(musicName:String, status:Bool) {
        
        computer?.setMusic(name: musicName , status: status)
    }
    
    func turnOffMusic(musicName:String, status:Bool) {
        
        computer?.setMusic(name: musicName, status: status)
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

class SportCarDirector{
    
    private var builder:CarBuilder
    
    init(builder:CarBuilder){
        
        self.builder = builder
    }
    
    func makeSportCar(){
        
        builder.setCar(car: getSportCar())
        builder.setEngine(engine: getEngine())
        builder.setComputer()
        builder.setSeats(number: 2)
        
    }
    
    private func getSportCar()->Car{
        
        return Sport()
    }
    
    private func getEngine()->Engine{
        
        return DieselEngine()
    }
}

class Main{
    
    init(){
        
        
        let builder = CarBuilder()
        
        let sportCarDirector = SportCarDirector(builder: builder)
        
        sportCarDirector.makeSportCar()
        
        var car = builder.getCar()
        
        car.turnOn()
        
        
    }
    
}
