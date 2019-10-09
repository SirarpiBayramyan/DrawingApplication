//
//  LinkedListTest.swift
//  LinkedList
//
//  Created by Sirarpi on 10/8/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

func testInt(){
    let numbers = [7, 4, 9, 3, 97, 5]
    let integersList = LinkedList<Int>()
    for number in numbers {
        integersList.append(number)  //append int
    }
    print(integersList)
    print(integersList.head!.value) //head
    print(integersList.last!.value) //last
    
    let second = integersList.head?.next
    
    if integersList.head?.next === second {
        print("is equal")
    }
    
    if second === integersList.last {
        print("=")
    }else {
        print("is not equal")
    }
    
    //insert at first index
    integersList.insert(0, at: 3)
    print(integersList)
    
    for i in 0 ..< integersList.count  { //subscript
        print(integersList[i])
    }
    //let list = LinkedList<Int>()
    let prev = integersList.node(at: 2)
    let next = integersList.node(at: 3)
    let node = integersList.node(at: 3)
    if prev.next === node {
        print("is equal")
    }
    if next.previous === node {
        print("is equal")
    }
    
    
    let list = LinkedList<Int>()
    list.append(2)
    list.append(33)
    list.append(40)
    
    //insert List at last index
    integersList.insert(list, at: integersList.count)
    print(integersList)
    
    //append list to emptyList
    let list2 = LinkedList<Int>()
    list2.append(list)
    print(list2)
    
    //appendList
    list2.append(integersList)
    print(list2)
    
    //remove all elements
    list2.removeAll()
    print(list2)
    
    //remove at index
    print(integersList.remove(at: 4))
    
    //removeLast
    print(integersList.remove(at: integersList.count - 1))
    
    //reverse LinkedList
    print(integersList.reversed())
    
    

}
