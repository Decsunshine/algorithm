//
//  binarySearch.m
//  Sort_OC
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "binarySearch.h"

@implementation binarySearch

- (NSInteger)search:(NSMutableArray *)array target:(NSNumber *)target
{
    NSInteger index = -1;
    
    NSInteger first = 0;
    NSInteger end = array.count - 1;
    
    while (first <= end) {
        NSInteger middle = (first + end) / 2;
        if (target.integerValue == ((NSNumber *)array[middle]).integerValue) {
            index = middle;
            break;
        } else if (target.integerValue > ((NSNumber *)array[middle]).integerValue) {
            first = middle + 1;
        } else {
            end = middle - 1;
        }
    }
    
    return index;
}

@end
