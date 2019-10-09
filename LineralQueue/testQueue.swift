//
//  test.swift
//  LineralQueue
//
//  Created by Sirarpi on 9/7/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

func testInt(_ size_: Int) {
    
    let qi = Queue<Int>(size_)
    print(qi.isEmpty)    //true
    print(qi.isFull)     //false
    qi.dequeue()         //Queue is empty
    for i in 1...qi.size{
        _ = qi.enqueue(i*i)
    }
    
    print("front \(qi.front())")
    print("rear \(qi.rear())")
    qi.dequeue()
    print(qi.elements.count) //2
    print(qi.elements)
    print(qi.hashableArray())
    
}
//testInt(3)
func testString(_ size_: Int ) {
    
    let qs = Queue<String>(size_)
    print(qs.isEmpty)
    print(qs.isFull)
    
    
    qs.dequeue()
    print(qs.elements.count)
    print(qs.enqueue("One"))
    print(qs.enqueue("Two"))
    print(qs.enqueue("Three"))
    print("front \(qs.front())")
    print("rear \(qs.rear())")
    //print(qs.enqueue("Four"))
    qs.dequeue()
    print(qs.elements.count)
    
    
}
//testString(3)

func testPoint(_ size_: Int) {
    
    let qp = Queue<Point> (size_)
    print(qp.isEmpty)
    for i in 1...qp.size{
        print( qp.enqueue(Point(x: Double(i*2), y: Double(i/10))))
    }
    
    if(!qp.isEmpty){
        print(qp.front())
        qp.dequeue()
    }
    print(qp.elements.count)
    print(qp)
    
}
func testAny(){
    var queue = Queue<Any>()
    queue?.enqueue("element 1")
    queue?.enqueue("element 2")
    queue?.enqueue("element 3")
    for i in 1...5 {
        queue?.enqueue(2*i+4)
    }
    queue?.enqueue(2.001)
    queue?.dequeue()
    print(queue)
    
}
