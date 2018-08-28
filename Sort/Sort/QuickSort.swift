//
//  QuickSort.swift
//  Sort
//
//  Created by honglianglu on 12/05/2018.
//  Copyright © 2018 cc. All rights reserved.
//

import UIKit

class QuickSort: Sort {
    func sort(_ nums: inout [Int],_ first: Int, _ end: Int) {
        if first > end {
            return
        }
        var index = first
        for i in first...end {
            if nums[i] < nums[end] {
                if i != index {
                    nums.swapAt(i, index)
                }
                index += 1
            }
        }
        if index != end {
            nums.swapAt(index, end)
        }
        self.sort(&nums, first, index - 1)
        self.sort(&nums, index + 1, end)
    }
}
