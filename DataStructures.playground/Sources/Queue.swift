import Foundation

/*
 Queue is a DS that follow the FIFO rule.
 The first element to be added will also be the first element to be removed.
 One element is added on "the back of another" like a line.
 
 Queues are often used to save the order of elements that will be processed later.
 */

public struct Queue<Element> {
    var enqueuedList: [Element] = []
    var elements: [Element] = []

    public init() {}
    
    /// Adds a element to the queue
    public mutating func enqueue(_ element: Element) {
        enqueuedList.append(element)
    }

    /// Removes the first element from the queue if exists, otherwise returns `nil`
    @discardableResult
    public mutating func dequeue() -> Element? {
        if elements.isEmpty {
            elements = enqueuedList.reversed()
            enqueuedList.removeAll()
        }
        
        return elements.popLast()
    }
    
    /// Returns the fist element of the queue if exists, otherwise returns `nil`
    public func peek() -> Element? {
        elements.isEmpty ? enqueuedList.last : elements.first
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        let queue = elements.reversed() + enqueuedList
        return "\(queue)"
    }
}
