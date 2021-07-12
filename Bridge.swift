protocol Device{
    
    func setEnable()
    func setDisable()
    func setVolume(percent:Int)
    func setChannel(number:Int)
}

open class Remote{
    
    var device:Device
    
    init(device:Device){
        
        self.device = device
    }
    
    func enable(){
        self.device.setEnable()
    }
    
    func disable(){
        self.device.setDisable()
    }
    
    func volumeUp(){
        self.device.setVolume(percent: 5)
    }
    
    func volumeDown(){
        self.device.setVolume(percent: -5)
    }
    
    func channelUp(){
        self.device.setChannel(number: 1)
    }
    
    func channelDown(){
        self.device.setChannel(number: -1)
    }
    
}

class Radio:Device{
    
    func setEnable() {
        // radioyu aç.
    }
    
    func setDisable() {
        // radioyu kapat.
    }
    
    func setVolume(percent: Int) {
        // sesi arttır.
    }
    
    func setChannel(number: Int) {
        // kanalı değiştir.
    }
    
    
}

class TV:Device{
    
    func setEnable() {
        // tvyi aç.
    }
    
    func setDisable() {
        // tvyi kapat.
    }
    
    func setVolume(percent: Int) {
        // sesi arttır.
    }
    
    func setChannel(number: Int) {
        // kanalı değiştir.
    }
    
}


class SmartTVRemote:Remote{
    
    let netflix_channel_id = 100
    
    func startNetflix(){
        
        // netflix kanal bilgisini cihaza gönderiyor.
        self.device.setChannel(number: netflix_channel_id)
    }
    
}

class SmartTV:Device{
    
    func setEnable() {
        // tvyi aç.
    }
    
    func setDisable() {
        // tvyi kapat.
    }
    
    func setVolume(percent: Int) {
        // sesi arttır.
    }
    
    func setChannel(number: Int) {
        // kanalı değiştir.
        
        // Netflix
        if(number == 100){
            startApplication(id:number)
        }
        
    }
    
    // Akıllı televizyonun ekstra işlevi
    func startApplication(id:Int){
        // televizyonun sahip olduğu uygulamaları başlatır.
    }

}

class Main{
    
    init(){
        
        let tv = TV()
        
        let remote = Remote(device: tv)
        
        remote.enable()
    }
    
}