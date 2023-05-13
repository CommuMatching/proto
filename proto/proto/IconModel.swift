//
//  IconModel.swift
//  proto
//
//  Created by 玉川悠真 on 2023/05/01.
//

import SwiftUI
import CoreData
 
class IconModel : ObservableObject{
    @Published var imageData: Data = Data.init()
 
    @Published var isNewData = false
    @Published var updateItem : IconData!
    
    func writeData(context : NSManagedObjectContext) {
        
        /*if updateItem != nil{
            updateItem.imageData = imageData
 
            try! context.save()
            
            updateItem = nil
            isNewData.toggle()
            imageData = Data.init()
            return
        }*/
        
        let newIconData = IconData(context: context)
        newIconData.imageData = imageData
        
        do{
            try context.save()
            //isNewData.toggle()
            //imageData = Data.init()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func EditItem(item: IconData){
        updateItem = item
        
        imageData = item.imageData ?? Data.init()
        
        isNewData.toggle()
    }
}
