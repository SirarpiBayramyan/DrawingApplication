//
//  F.swift
//  LineralQueue
//
//  Created by Sirarpi on 9/7/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

 class Queue<Element> {
    var elements: [Element] = []
    var size = 0
    
    init?(){}
    
    //convenience init, which calls Init()
     init(_ size: Int){
        self.size = size
        self.elements.reserveCapacity(size)
        
    }
    
    //Checks whether the queue is empty or not.
    var isEmpty: Bool {
        return elements.isEmpty
    }
    ////Checks whether the queue is full or not.
    var isFull: Bool {
        return self.size == self.elements.count
        
    }
    
    
    //Insert an element into the queue.
    func enqueue(_ elem: Element) ->Bool{
        if(self.isFull){
            print("Queue is full, you can't insert new element.Please dequeue() \(self) ")
            return false
        }else{
            elements.append(elem)
            print(elem)
            return true
        }
    }
    //remove element from queue
    func dequeue () {
        if(self.isEmpty){
            print("Queue is empty")
        }
        else{
            elements.removeLast()
        }
    }
    
    
    func front () -> Element {
          return self.elements.first!
    }
    
    func rear() -> Element {
        return self.elements.last!
    }
    
}

extension Queue where Element: Hashable {
    func hashableArray()->[Element]{
        var hashArray = [Element]()
        while !elements.isEmpty {
            hashArray.append(elements.popLast()!)
        }
        return hashArray
    }
}
extension Queue: CustomStringConvertible{
    var description: String {
           let topDivider = "\n------Queue ------ \n"
           let bottonDivider = "\n------ End ----- \n"
           
           let items = elements.map { "\($0)" }.reversed().joined(separator: "\n")
           return topDivider + items + bottonDivider
       }
}
 




