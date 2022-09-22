//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/19.
//

protocol Queue {
    func push(_ element: CalculateItem)
    func pop() -> CalculateItem?
}

class CalculatorItemQueue: Queue {
    private var enqueue: [CalculateItem] = []
    private var dequeue: [CalculateItem] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    func push(_ element: CalculateItem) {
        enqueue.append(element)
    }
    
    func pop() -> CalculateItem? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
}
