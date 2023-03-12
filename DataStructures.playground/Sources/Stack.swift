import Foundation

/*
 Stack is a DS that follow the LIFO rule.
 The last element to be added will be first to be removed.
 One element is added on "the top of another" like a pile of objects.
 */

public struct Stack<Element> {
    private var array: [Element] = []
    
    public init(_ elements: [Element]) {
        array = elements
    }
    
    /// Adds an element to the top of stack
    public mutating func push(_ value: Element) {
        array.append(value)
    }
    
    /// Removes and returns the last element of the collection if exists, otherwise returns `nil`
    @discardableResult
    public mutating func pop() -> Element? {
        array.popLast()
    }
    
    /// Gets the top most element if exists, otherwise returns `nil`
    public func peek() -> Element? {
        array.last
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        var result = ""

        for char in array.reversed() {
            result += "| \(char) |\n"
        }
        result += "|___|"
        
        return result
    }
}
