import UIKit

var ds = DoublyLinkedList<Int>()

ds.push(2)
ds.push(1)

print(ds.description)

ds.append(4)
print(ds.description)

var node = ds.node(at: 1)

ds.insert(3, after: node!)
print(ds.description)

ds.pop()
print(ds.description)

ds.removeLast()
print(ds.description)

node = ds.node(at: 1)
ds.remove(after: node!)
node = nil

print(ds.description)

ds.removeLast()
print(ds.description)
