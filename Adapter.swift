protocol Document{
    
    func getFileExtension()->String
    func getUniformType()->String
    func getContent()->String
}

class PDF:Document{
    
    private var content:String
    
    init(content:String){
    
        self.content = content
    }
    
    func getFileExtension() -> String {
        return ".pdf"
    }
    
    func getUniformType() -> String {
        return "com.adobe.pdf"
    }
    
    func getContent() -> String {
        return self.content
    }
}


class Service{
    
    var document:Document
    
    init(document:Document){
        
        self.document = document
    }
    
    
    func sendDocument(){
        
        if(document.getFileExtension() == ".pdf" && document.getUniformType() == "com.adobe.pdf"){
            
            // Dökümanı sunucuya gönderme işlemi
        }else {
            
            print("Geçersiz döküman tipi")
        }
        
    }
    
}

class Word{
    
    var content:String
    
    init(content:String){
        self.content = content
    }
}

class WordAdapter:Document{
    
    var word:Word
    
    init(word:Word){
        
        self.word = word
        
        convertWordToPDF(content: self.word.content)
    }
    
    func getFileExtension() -> String {
        return ".pdf"
    }
    
    func getUniformType() -> String {
        return "com.adobe.pdf"
    }
    
    func getContent() -> String {
        return self.word.content
    }
    
    private func convertWordToPDF(content:String){
        
        // Word içeriğini PDF içeriğine çeviren işlemler.
    }
}

class Main{
    
    init(){
        
        // PDF Gönderiyoruz.
        
        let pdf = PDF(content: "Desing Patterns - Bridge ...")
        
        let service = Service(document: pdf)
        
        service.sendDocument()
        
        
        // Word Gönderiyoruz.
        
        let word = Word(content: "Design Patterns - Adapter ...")
        
        let adapter = WordAdapter(word: word)
        
        let service2 = Service(document: adapter)
        
        service2.sendDocument()
    }
}