//
//  testStack.swift
//  Stack
//
//  Created by Sirarpi on 10/5/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

func testStack () {
    var stack = Stack<Any>()
    stack.push("Element 1")
    stack.push("Element 2")
    stack.push("Element 3")
    stack.push(4)
    stack.push(14)
    stack.push(43)
    stack.push(24)
    stack.push(77.00000)
    stack.push(0.24)
    stack.push(1.24)
    stack.push(0)
    stack.push(-1)
    stack.push(-5)
    stack.pop()
    stack.count
    stack.isEmpty
    stack.peek()
    print(stack)
    print(stack.isEmpty)
     
    var intStack = Stack<Int>()
    intStack.append(element: 3)
    for item in 1...5{
        intStack.push(item * item)
    }
    print(intStack)
    print(intStack.isTop(2))


}
