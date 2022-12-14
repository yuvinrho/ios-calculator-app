//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/19.
//

struct CalculatorItemQueue<CalculateItem> {
    private var enqueue: [CalculateItem] = []
    private var dequeue: [CalculateItem] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    mutating func push(_ element: CalculateItem) {
        enqueue.append(element)
    }
    
    mutating func push(_ elements: [CalculateItem]) {
        elements.forEach { push($0) }
    }
    
    mutating func pop() -> CalculateItem? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
    
    mutating func peek() -> CalculateItem? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.first
    }
}
