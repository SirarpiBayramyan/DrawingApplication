//
//  File.swift
//  Stack
//
//  Created by Sirarpi on 10/5/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

protocol Container {
    associatedtype Element
    mutating func append (element: Element)
    
    var count: Int { get }
    subscript(i: Int) -> Element{ get }
}

struct Stack <Element>: Container {
    
    var elements = [Element]()
    var count: Int {
        return elements.count
    }
    
    subscript(i: Int) -> Element {
        return elements[i]
    }
    mutating func append(element: Element) {
        self.push(element)
    }
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element? {
        return elements.removeLast()
    }
    mutating func peek() ->Element {
        return elements.last!
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    func toInverseArray() -> [Element]{
        var array = [Element]()
        for _ in 0..<elements.count {
            array.append(elements.last!)
        }
        return array
    }
    
}

extension Stack : CustomStringConvertible {
    
    var description: String {
        let topDivider = "\n------------ Stack ---------- \n"
        let bottonDivider = "\n------------ End ---------- \n"
        
        let items = elements.map { "\($0)" }.reversed().joined(separator: "\n")
        return topDivider + items + bottonDivider
    }
}

extension Stack where Element: Equatable {
    
    func isTop(_ element: Element) -> Bool {
        guard let topItem = elements.last else {return false}
        return topItem == element
    }
}
