//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 노유빈 on 2022/09/19.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemLinkedList!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemLinkedList()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func generateRandomDoubleTypeCalculateItem() -> Double {
        return Double.random(in: 0...1)
    }
    
//    func generateRamdomOperatorTypeCalculateItem() -> CalculateItem {
//        return Operator.allCases.randomElement()!
//    }
    
    func generateRandomCalculateItems() -> [Double] {
        var calculateItems: [Double] = []
        
        for _ in 1...50 {
            calculateItems.append(generateRandomDoubleTypeCalculateItem())
            //calculateItems.append(generateRamdomOperatorTypeCalculateItem())
        }
        
        return calculateItems
    }
    
    func pushCalculateItems(_ calculateItems: [Double]) {
        for calculateItem in calculateItems {
            sut.push(calculateItem)
        }
    }
    
    func isEqualCalculateItem(_ item1: Double, _ item2: Double) -> Bool {
        if let item1 = item1 as? Double {
            if item1 == item2 as? Double { return true }
        }
//        else if let item1 = item1 as? Operator {
//            if item1 == item2 as? Operator { return true }
//        }
        
        return false
    }
    
    func test_calculateItems를_push한_순서대로_pop이_되는지_확인() {
        let calculateItems = generateRandomCalculateItems()
        var result = true
        
        pushCalculateItems(calculateItems)
        
        for calculateItem in calculateItems {
            guard let poppedItem = sut.pop() else { return }
            
            if !isEqualCalculateItem(calculateItem, poppedItem as! Double) {
                debugPrint("\(calculateItem), \(poppedItem), \(sut.count)")
                result = false
                break
            }
            
            debugPrint("\(calculateItem), \(poppedItem), \(sut.count)")
        }
        
        XCTAssert(result)
    }
    
    func test_비어있는_큐에_pop_하면_nil을_반환하는지_확인() {
        let calculateItem: CalculateItem?
        
        calculateItem = sut.pop() as? any CalculateItem
        
        XCTAssertNil(calculateItem)
    }
    
//    func test_peek() {
//        let calculateItem = generateRandomDoubleTypeCalculateItem()
//
//        sut.push(calculateItem)
//        guard let peekedItem = sut.peek() else { return }
//
//        let result = isEqualCalculateItem(calculateItem, peekedItem)
//
//        XCTAssert(result)
//    }
}
