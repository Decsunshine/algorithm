//
//  ViewController.swift
//  Sort
//
//  Created by honglianglu on 12/05/2018.
//  Copyright © 2018 cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var nums1 = [Int]()
        var nums2 = [Int]()
        if let randomArray = self.createRandomArray(count: 500) {
            nums1 = randomArray
            nums2 = randomArray
        }
        print("start")
        let startTime = CACurrentMediaTime()
        print(nums1)
        QuickSort.init().sort(&nums1, 0, nums1.count - 1)
        print(nums1)
        let endTime = CACurrentMediaTime()
        print("Time - \(endTime - startTime)")
        
        let startTime2 = CACurrentMediaTime()
        print(nums2)
        ThreeWayQuickSort.init().sort(&nums2, 0, nums2.count - 1)
        print(nums2)
        let endTime2 = CACurrentMediaTime()
        print("Time - \(endTime2 - startTime2)")
    }
    
    func createRandomArray(count: Int) -> Array<Int>! {
        var array = [Int]()
        for _ in 0...(count - 1) {
            array.append(createRandomMan(start: 1,end: 100)() ?? 0)
        }
        
        return array
    }
    
    func createRandomMan(start: Int, end: Int) ->() ->Int! {
        //根据参数初始化可选值数组
        var nums = [Int]();
        for i in start...end{
            nums.append(i)
        }
        
        func randomMan() -> Int! {
            if !nums.isEmpty {
                //随机返回一个数，同时从数组里删除
                let index = Int(arc4random_uniform(UInt32(nums.count)))
                return nums.remove(at: index)
            } else {
                //所有值都随机完则返回nil
                return nil
            }
        }
        return randomMan
    }
}

