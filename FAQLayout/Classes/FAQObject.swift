//
//  FAQObject
//  FAQLayout
//
//  Created by Priya Srivastava on 02/11/19.
//

import UIKit
public class FaqData:NSObject{
    var subTitle:String = ""
    var subData:[String] = []
    
    init?(withFaq data:NSDictionary?){
        
        if data != nil{
            super.init()
            self.subTitle   = data?["subTitle"] as? String ?? ""
            self.subData    = data?["subData"] as? [String] ?? []
        }else{
            return nil
        }
    }
    
    class func getFaqData(fromArray array:[NSDictionary]?)->[FaqData]{
        
        var returnArray:[FaqData] = []
        if array != nil{
            
            for item in array!{
                
                if let faqData:FaqData = FaqData.init(withFaq: item){
                    returnArray.append(faqData)
                }
            }
        }
        
        return returnArray
    }
}

class FaqObject: NSObject {
    
    var title:String = ""
    var faqData:[FaqData] = []
    
    init?(withFaqData data:NSDictionary?){
        if data != nil{
            super.init()
            self.title = data?["title"] as? String ?? ""
            self.faqData = FaqData.getFaqData(fromArray: data?["faqData"] as? [NSDictionary])
            
        }else{
            return nil
        }
    }
    
    class func getFaqObjects(fromArray array:[NSDictionary]?) -> [FaqObject]{
        var returnArray:[FaqObject] = []
        
        if array != nil{
            
            for item in array!{
                if let faqObject:FaqObject = FaqObject.init(withFaqData: item){
                    returnArray.append(faqObject)
                }
            }
        }
        return returnArray
    }
    
}
