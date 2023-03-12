import UIKit

var stack = Stack([1, 2, 3, 4])

stack.push(5)

print(stack.description)
print(" ")

stack.pop()
print(stack.description)
print(" ")

print("topmost element -> \(stack.peek())")
