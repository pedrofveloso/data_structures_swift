import Foundation

/*
 A linked list is collection made by nodes and connectors.
 Each node has a value and a reference to the next node.
 A linked list is a unidirectional structure,
 which means that you can traverse it in one direction (start -> end)
 */

public struct LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    public init() {}
    
    /// Adds an element to the begin of the linked list
    public mutating func push(_ value: Element) {
        let newHead = Node(value, next: head)
        head = newHead
        
        if tail == nil {
            tail = head
        }
    }
    
    /// Adds an element to the end of the linked list
    public mutating func append(_ value: Element) {
        if head == nil {
            push(value)
            
        } else {
            let newTail = Node(value)
            tail?.next = newTail
            tail = newTail
        }
    }
    
    /// Insert an element after the given node
    public mutating func insert(_ value: Element, after node: Node<Element>) {
        if node === tail {
            append(value)
            
        } else {
            let newNode = Node(value, next: node.next)
            node.next = newNode
        }
        
    }
    
    /// Gets the node at a specific index
    public mutating func node(at index: Int) -> Node<Element>? {
        var node = head
        var currentIndex = 0
        while node != nil {
            if currentIndex == index {
                break

            } else {
                node = node?.next
                currentIndex += 1
            }
        }
        
        return node
    }
    
    /// Removes the first element of the list and returns its value (if exists), otherwise returns `nil`
    @discardableResult
    public mutating func pop() -> Element? {
        let value = head?.value
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return value
    }
    
    /// Removes an element after a given node and returns its value (if exists), otherwise returns `nil`
    @discardableResult
    public mutating func remove(after node: Node<Element>) -> Element? {
        let removedValue = node.next?.value

        if node.next === tail {
            tail = node
        }

        node.next = node.next?.next
        
        return removedValue
    }
    
    /// Removes the last element of the list and returns its value (if exists), otherwise returns `nil`
    @discardableResult
    public mutating func removeLast() -> Element? {
        let removedValue = tail?.value

        guard head != nil else {
            return nil
        }
        
        guard head !== tail else {
            tail = nil
            head = tail
            
            return removedValue
        }

        var node = head
    
        while node != nil {
            if node?.next === tail {
                node?.next = nil
                tail = node
                break
            }
            node = node?.next
        }
        
        return removedValue
    }
}

extension LinkedList {
    public class Node<Element> {
        var value: Element
        var next: Node?
        
        public init(_ value: Element, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var node = head
        var string = ""

        while node != nil {
            let suffix = node === tail ? "" : " -> "
            string += "\(String(describing: node?.value))\(suffix)"
            node = node?.next
        }
        
        return string + " | H: \(String(describing: head?.value)) T: \(String(describing: tail?.value))"
    }
}
