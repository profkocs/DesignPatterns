protocol DataSource{
    
    func writeData(data:String)
}

class FileSource:DataSource{

    func writeData(data: String) {
        
        print("Dosya Kaydedildi")
    }
}


class DataDecorater:DataSource{
    
    var dataSource:DataSource
    init(dataSource:DataSource){
        
        self.dataSource = dataSource
    }
    
    func writeData(data: String) {
        
        dataSource.writeData(data: data)
    }
    
}

class EncryptDataDecorater:DataDecorater{
    
    
    override init(dataSource:DataSource){
        
        super.init(dataSource: dataSource)
    }
    
    override func writeData(data: String) {
        
        // Önce Veriyi şifreliyor
        print("Dosya Şifrelendi")
        
        // Sonra üst sınıfı çalıştırıyor
        
        super.writeData(data: data)
    }
}

class EncompressDataDecorater:DataDecorater{
    
    override init(dataSource:DataSource){
        
        super.init(dataSource: dataSource)
    }
    
    override func writeData(data: String) {
        
        // Önce Veriyi sıkıştırıyor
        print("Dosya Sıkıştırıldı")
        
        // Sonra üst sınıfı çalıştırıyor
        
        super.writeData(data: data)
    }
}

class Main{
    
    init(){
        
        // Text kayıt etme nesnemizi oluşturuyoruz.
        var fileSource = FileSource()
        
        // Sonra nesnemiz Sıkıştırma Decoraterına gönderiliyor ve sıkıştırılıyor.
        var enCompressData = EncompressDataDecorater(dataSource: fileSource)
        
        // Nesnemiz şifreleme işlemlerinden geçiyor.
        var encryptData = EncryptDataDecorater(dataSource: enCompressData)
        
        // Plain textimizi bu kısımda oluşturuyoruz ve şifreleme decoratora gönderiyoruz.
        encryptData.writeData(data: "Dosya")
        
    }
    
}