//
//  QuickSort.m
//  Sort_OC
//
//  Created by lu hongliang on 2019/4/10.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

- (void)sort:(NSMutableArray *)array :(NSNumber *)start :(NSNumber *)end
{
    if (start.integerValue > end.integerValue) {
        return;
    }
    if (array.count <= 0) {
        return;
    }
    
    NSInteger index = start.intValue;
    for(int i = start.intValue; i < end.intValue; i++) {
        if (((NSNumber *)array[i]).integerValue < ((NSNumber *)array[end.integerValue]).integerValue) {
            if (index != i) {
                [self swap:array :@(index) :@(i)];
            }
            index ++;
        }
    }
    
    if (index != end.integerValue) {
        [self swap:array :@(index) :end];
    }
    
    [self sort:array :start :@(index - 1)];
    [self sort:array :@(index + 1) :end];
}

- (void)swap:(NSMutableArray *)array :(NSNumber *)one :(NSNumber *)two
{
    NSNumber *tmp = array[one.intValue];
    array[one.intValue] = array[two.intValue];
    array[two.intValue] = tmp;
}

@end
