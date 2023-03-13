import Foundation

/*
 Stack is a DS that follow the LIFO rule.
 The last element to be added will be first to be removed.
 One element is added on "the top of another" like a pile of objects.
 */

public struct Stack<Element> {
    private var elements: [Element] = []
    
    public init(_ elements: [Element]) {
        self.elements = elements
    }
    
    /// Adds an element to the top of stack
    public mutating func push(_ value: Element) {
        elements.append(value)
    }
    
    /// Removes and returns the last element of the collection if exists, otherwise returns `nil`
    @discardableResult
    public mutating func pop() -> Element? {
        elements.popLast()
    }
    
    /// Gets the top most element if exists, otherwise returns `nil`
    public func peek() -> Element? {
        elements.last
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        var result = ""

        for char in elements.reversed() {
            result += "| \(char) |\n"
        }
        result += "|___|"
        
        return result
    }
}
