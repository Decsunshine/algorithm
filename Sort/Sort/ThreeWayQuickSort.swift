//
//  ThreeWayQuickSort.swift
//  Sort
//
//  Created by honglianglu on 12/05/2018.
//  Copyright © 2018 cc. All rights reserved.
//

import UIKit

class ThreeWayQuickSort: Sort {
    func sort(_ nums: inout [Int],_ first: Int, _ end: Int) {
        if first >= end {
            return
        }
        
        var lowIndex = first
        var highIndex = end
        
        if nums[first] > nums[end] {
            nums.swapAt(first, end)
        }
        
        let lowNum = nums[first]
        let highNum = nums[end]
        
        var i = first
        while (i <= end) && (lowIndex < highIndex) {
            if nums[i] < lowNum {
                if i != lowIndex + 1 {
                    nums.swapAt(lowIndex, lowIndex + 1)
                }
                if i != lowIndex {
                    nums.swapAt(i, lowIndex)
                }
                
                lowIndex += 1
            } else if (nums[i] > highNum) && (i < highIndex) {
                if i != highIndex - 1 {
                    nums.swapAt(highIndex, highIndex - 1)
                }
                if i != highIndex {
                    nums.swapAt(i, highIndex)
                }
                
                highIndex -= 1
            } else {
                i += 1
            }
        }

        self.sort(&nums, first, lowIndex - 1)
        // self.sort(&nums, lowIndex + 1, highIndex - 1)  这个可以不要，是有序的
        self.sort(&nums, highIndex + 1, end)
    }
}
