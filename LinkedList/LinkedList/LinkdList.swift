//
//  LinkdList.swift
//  LinkedList
//
//  Created by Sirarpi on 10/8/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import Foundation

public  final class  LinkedList<Element> {
    
    //LinkedList's Node Class Declaration
   public class LinkedListNode<Element> {
        var value: Element
        var next:  LinkedListNode?
        weak var previous: LinkedListNode?
        
        public init(value: Element) {
            self.value = value
        }
    }

    //Typealiasing the node classto increase readability of code
    public typealias Node = LinkedListNode<Element>
    
    //The head of the LinkedList
    private(set) var head: Node?
    
    //Computed property to iterate through the LinkedList and return the last node (if any)
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    //Computed property to check if the LinkedList is empty
    public var IsEmpty: Bool {
        return head == nil
    }
    
    //Computed property to iterate through the linked list and return the total number of nodes
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    //Default initializer
    public init() {}
    
    //Subscript function to return the node at a specific index
    public subscript(index: Int) -> Element {
        let node = self.node(at: index)
        return node.value
    }
    
    //Function to return the node at a specific index. Crashes if index is out of bounds (0...self.count)
    public func node(at index: Int) -> Node {
        assert(head != nil, "List is empty")
        assert(index >= 0, "index must be greater or equal to 0")
        
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
           assert(node != nil, "index out of bounds")
            return node!
        }
    }
    
    // Append a value to the end of the list
    public func append(_ value: Element) {
        let newNode = Node(value: value)
        append(newNode)
    }
    
   // Append a copy of a LinkedListNode to the end of the list
    public func append(_ node: Node){
        let newNode = node
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    // Append a copy of a LinkedList to the end of the list
    public func append(_ list: LinkedList) {
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            append(node.value)
            nodeToCopy = node.next
        }
    }
    
    // Insert a value at a specific index. Crashes if index is out of bounds (0...self.count)
    public func insert(_ value: Element, at index: Int) {
        let newNode = Node(value: value)
        insert(newNode, at: index)
    }
    
    // Insert a copy of a node at a specific index. Crashes if index is out of bounds (0...self.count)
    public func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = node(at: index - 1)
            let next = prev.next
            newNode.next = prev
            newNode.next = next
            next?.previous = newNode
            prev.next = newNode
        }
    }
    
    // Insert a copy of a LinkedList at a specific index. Crashes if index is out of bounds (0...self.count)
    public func insert(_ list : LinkedList, at index: Int){
        guard !list.IsEmpty else { return }
        
        if index == 0 {
            list.last?.next = head
            head = list.head
        } else {
            let prev = node(at: index - 1)
            let next = prev.next
            
            prev.next = list.head
            list.head?.previous = prev
            list.last?.next = next
            next?.previous = list.last
        }
    }
    
    // Function to remove all nodes/value from the list
    public func removeAll() {
        head = nil
    }
     
    // Function to remove a specific node
    public func remove(node: Node) -> Element {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next  = next
        } else {
            head = next
        }
        next?.previous = prev
        node.next = nil
        
        return node.value
    }
    
    // Function to remove the last node/value in the list. Crashes if the list is empty
    public func removeLast() -> Element {
        assert(!IsEmpty)
        return remove(node: last!)
    }
    
    // Function to remove a node/value at a specific index. Crashes if index is out of bounds (0...self.count)
    public func remove(at index: Int) -> Element {
        let node = self.node(at: index)
        return remove(node: node)
    }
}

// Extension to enable the standard conversion of a list to String
extension LinkedList: CustomStringConvertible {
    public var description: String {
        var string = "["
        var node = head
        while let nd = node {
            string += "\(nd.value)"
            node = nd.next
            if node != nil {
                string += ", "
            }
        }
            return string + "]"
    }
}

//Extension to enable initialization from an Array
extension LinkedList {
    convenience init(array: Array<Element>) {
        self.init()
        array.forEach { append($0) }
    }
}

//Extension to enable initialization from an Array Literal
extension LinkedList: ExpressibleByArrayLiteral {

    public convenience init(arrayLiteral elements: Element...){
        self.init()
        elements.forEach{
            append($0)
        }
    }
}
//Collection
extension LinkedList: Collection {
  
    public typealias Index = LinkedListIndex<Element>
    
    // The position of the first element in a nonempty collection
    public var startIndex: Index {
        get {
            return LinkedListIndex<Element>(node: head, tag: 0)
        }
    }
    
    // The collection's "past the end" position---that is, the position one
    // greater than the last valid subscript argument
    public var endIndex: Index {
        get {
            if let h = self.head {
                return LinkedListIndex<Element>(node: h, tag: count)
            } else {
                return LinkedListIndex<Element>(node: nil, tag: startIndex.tag)
            }
        }
    }
    
    public subscript(position: Index) -> Element {
        get {
            return position.node!.value
        }
    }
    public func index(after idx: Index) -> Index {
        return LinkedListIndex<Element>(node: idx.node?.next, tag: idx.tag + 1)
    }
    
    
}

//Collection Index
//Custom index type that contains a reference to the node at index 'tag'
public struct LinkedListIndex<Element>: Comparable {
    fileprivate let node: LinkedList<Element>.LinkedListNode<Element>?
    fileprivate let tag: Int //
    
    public static func == <Element>(lhs: LinkedListIndex<Element>, rhs: LinkedListIndex<Element>) -> Bool {
         return (lhs.tag == rhs.tag)
    }
    public static func < <Element> (lhs: LinkedListIndex<Element>, rhs: LinkedListIndex<Element>) -> Bool {
         return (lhs.tag < rhs.tag)
    }
}
