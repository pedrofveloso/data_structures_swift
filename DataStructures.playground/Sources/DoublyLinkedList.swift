import Foundation

/*
 A doubly linked list is a linked list where each node has an additional pointer
 to the previous node. This addition turns the list bidirectional, which means that we can
 traverse the list from back to front.
 */

public struct DoublyLinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    public init() {}
    
    /// Adds an element to the begin of the list
    public mutating func push(_ value: Element) {
        print(#function)
        let node = Node(value, next: head)

        if isEmpty {
            head = node
            tail = head
        } else {
            head?.previous = node
            node.next = head
            head = node
        }
    }
    
    /// Adds an element to the end of the list
    public mutating func append(_ value: Element) {
        print(#function)
        if isEmpty {
            push(value)
        } else {
            let node = Node(value, previous: tail)
            tail?.next = node
            tail = node
        }
    }
    
    /// Add an element after a given node
    public mutating func insert(_ value: Element, after node: Node<Element>) {
        print(#function)
        if node === tail {
            append(value)
        } else {
            let newNode = Node(value, previous: node, next: node.next)
            node.next = newNode
            newNode.next?.previous = newNode
        }
    }
    
    /// Gets the node at the given index if exists, otherwise returns `nil`
    public func node(at index: Int) -> Node<Element>? {
        var node = head
        var currentIndex = 0
        
        while node != nil && currentIndex != index {
            currentIndex += 1
            node = node?.next
        }
        
        return node
    }
    
    /// Removes the first element of the list and returns it if exists, otherwise returns `nil`
    @discardableResult
    public mutating func pop() -> Element? {
        print(#function)
        if isEmpty {
            return nil
        }
        
        let removedElement = head?.value
        
        head = head?.next
        head?.previous = nil
        
        if isEmpty {
            tail = head
        }
        
        return removedElement
    }
    
    /// Removes the last element of the list and returns it if exists, otherwise returns `nil`
    @discardableResult
    public mutating func removeLast() -> Element? {
        print(#function)
        if isEmpty {
            return nil
        }
        
        if head === tail {
            return pop()
        }

        let removedElement = tail?.value

        let newTail = tail?.previous
        newTail?.next = nil

        tail = newTail
        
        return removedElement
    }
    
    /// Removes an element after a given node and returns its value if exists, otherwise returns `nil`
    @discardableResult
    public mutating func remove(after node: Node<Element>) -> Element? {
        print(#function)
        if isEmpty {
            return nil
        }
        
        if head === tail {
            return pop()
        }
        
        if node === tail {
            return removeLast()
        }
        
        let removedElement = node.next?.value
        let newNext = node.next?.next

        node.next = newNext
        newNext?.previous = node
        
        return removedElement
    }
 }

extension DoublyLinkedList {
    public class Node<Element> {
        var previous: Node?
        var value: Element
        var next: Node?
        
        public init(_ value: Element, previous: Node? = nil, next: Node? = nil) {
            self.previous = previous
            self.value = value
            self.next = next
        }
        
        deinit {
            print("deinit node with value: \(value)")
        }
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        var node = head
        var string = ""

        while node != nil {
            let prefix = node === head ? "\(String(describing: node?.previous?.value)) <--> " : "-> "
            let suffix = node === tail ? " <--> \(String(describing: node?.next?.value))" : " <-"
            
            string += "\(prefix)\(String(describing: node?.value))\(suffix)"
            node = node?.next
        }
        
        string = string.isEmpty ? "empty" : string
        
        return string + " | H: \(String(describing: head?.value)) T: \(String(describing: tail?.value))"
    }
    
    public func desc() {
        var node = head
        
        while node != nil {
            print("\(node?.previous?.value) <-> \(node?.value) <-> \(node?.next?.value)\n")
            node = node?.next
        }
    }
}
