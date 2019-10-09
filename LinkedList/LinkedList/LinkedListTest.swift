//
//  LinkedListTest.swift
//  LinkedList
//
//  Created by Sirarpi on 10/8/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation


//test function for "Int"
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


//test function for "String"
func testString() {
    let strings = ["one", "two", "three"]
    let stringsList = LinkedList<String>()
    for string in strings {
        stringsList.append(string)
    }
    print(stringsList)
    let second = stringsList.head?.next
    if stringsList.head?.next === second {
        print("is equal")
    }
    stringsList.insert("zero", at: 3)
    print(stringsList)
    
    for i in 0 ..< stringsList.count  { //subscript
        print(stringsList[i])
    }
    
    let prev = stringsList.node(at: 2)
    let next = stringsList.node(at: 3)
    let node = stringsList.node(at: 3)
    if prev.next === node {
        print("is equal")
    }
    if next.previous === node {
        print("is equal")
    }
    
    let list = LinkedList<String>()
    list.append("BMW")
    list.append("Chevrolet")
    list.append("Mercedes")
    list.append("Audi")
    list.append("Mazda")
    
    //insert List at last index
    stringsList.insert(list, at: stringsList.count)
    print(stringsList)
    
    //append list to emptyList
    let list2 = LinkedList<String>()
    list2.append(list)
    print(list2)
    
    //appendList
    list2.append(stringsList)
    print(list2)
    
    //remove all elements
    list2.removeAll()
    print(list2)
    
    //remove at index
    print(stringsList.remove(at: 4))

    //removeLast
    print(stringsList.remove(at: stringsList.count - 1))

    //reverse LinkedList
    print(stringsList.reversed())

    
}
