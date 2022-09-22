//
//  CalculatorItemLikedList.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

extension Double: CalculateItem { }

class Node {
    var value: CalculateItem
    var next: Node?
    
    init(value: CalculateItem, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class CalculatorItemLinkedList: Queue {
    func push(_ element: CalculateItem) {
        let node = Node(value: element, next: nil)
        push(node)
    }
    
    func pop() -> CalculateItem? {
        let node = popLinkedList()
        return node?.value
    }
    
    var head: Node?
    var tail: Node?
    var count: Int = 0
    
    func push(_ node: Node) {
        count += 1
        
        // 큐가 비어있을때
        if head == nil {
            head = node
            tail = node
            return
        }
        
        tail?.next = node
        tail = node
    }
    
    func popLinkedList() -> Node? {
        if head == nil { return nil }
        
        count -= 1
        if count == 1 {
            let current = head
            head = nil
            tail = nil
            return current
        }
        
        let current = head
        head = head?.next
        return current
        
    }
}
