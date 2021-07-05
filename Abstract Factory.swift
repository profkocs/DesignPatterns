protocol Button{

    // Kullanıcı button a tıklarsa tetiklenecek.
    func onClick(completionHandler:()->())
    
}

protocol CheckBox{
    
    // Kullanıcı checkBox a tıklarsa tetiklenecek.
    func onSelect()
    
    // Checkbox'ın seçilip seçilmediği bilgisini döndürecek.
    func isCheckBoxSelected()->Bool
    
}


class MobileButton:Button{
    
    func onClick(completionHandler: () -> ()) {
        completionHandler()
    }
    
    
}

class WebButton:Button{
    
    func onClick(completionHandler: () -> ()) {
        completionHandler()
    }
    
    
}

class MobileCheckBox:CheckBox{
    
    private var isSelected = false
    
    func onSelect() {
        
        if(isSelected){
            
            isSelected = false
            
        } else {
            
            isSelected = true
        }
        
    }
    
    func isCheckBoxSelected() -> Bool {
        return isSelected
    }
    
}

class WebCheckBox:CheckBox{
    
    private var isSelected = false
    
    func onSelect() {
        
        if(isSelected){
            
            isSelected = false
            
        } else {
            
            isSelected = true
        }
        
    }
    
    func isCheckBoxSelected() -> Bool {
        return isSelected
    }
    
}

protocol Platform{
    
    func createButton() -> Button
    func createCheckBox() -> CheckBox
    func showContract()
    
}

class Mobile:Platform{
    
    func createButton() -> Button {
        return MobileButton()
    }
    
    func createCheckBox() -> CheckBox {
        return MobileCheckBox()
    }
    
    func showContract() {
        
        let button = createButton()
        let checkBox = createCheckBox()
        
        button.onClick {
            
            if(checkBox.isCheckBoxSelected()){
                
                print("Sözleşmeyi kabul ettiniz.")
                
            } else {
                
                print("Sözleşmeyi kabul etmelisiniz.")
            }
            
        }
        
    }
}

class Browser:Platform{
    
    func createButton() -> Button {
        return WebButton()
    }
    
    func createCheckBox() -> CheckBox {
        return WebCheckBox()
    }
    
    func showContract() {
        
        let button = createButton()
        let checkBox = createCheckBox()
        
        button.onClick {
            
            if(checkBox.isCheckBoxSelected()){
                
                print("Sözleşmeyi kabul ettiniz.")
                
            } else {
                
                print("Sözleşmeyi kabul etmelisiniz.")
            }
            
        }
    }
}

class Main{
    
    init(){
        
        // Sözleşme için mobil platformu seçersek.
        
        let mobile = Mobile()
        
        mobile.showContract()
        
        // Sözleşme için tarayıcı platformunu seçersek.
        
        let browser = Browser()
        
        browser.showContract()
        
    }
    
    
    
}