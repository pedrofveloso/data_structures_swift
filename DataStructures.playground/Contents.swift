import UIKit

var ds = Queue<Int>()

ds.enqueue(1)
ds.enqueue(2)
print("removing \(ds.dequeue())...")
print(ds)
ds.enqueue(3)
print(ds)
print("first element: \(ds.peek())")
