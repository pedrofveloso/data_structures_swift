import UIKit

var ds = LinkedList<Int>()

ds.append(1)
ds.append(3)

print(ds.description)

var n = ds.node(at: 0)
ds.insert(2, after: n!)
print(ds.description)

ds.push(0)
print(ds.description)

ds.pop()
print(ds.description)

n = ds.node(at: 0)
ds.remove(after: n!)
print(ds.description)

ds.removeLast()
print(ds.description)
