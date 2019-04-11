//
//  MergeSort.m
//  Sort_OC
//
//  Created by lu hongliang on 2019/4/10.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

- (void)sort:(NSMutableArray *)array :(NSNumber *)start :(NSNumber *)end
{
    if (start.integerValue >= end.integerValue) {
        return;
    }
    if (array.count < 0) {
        return;
    }
   
    NSInteger middle = start.integerValue + (end.integerValue - start.integerValue) / 2;
    [self sort:array :start :@(middle)];
    [self sort:array :@(middle + 1) :end];
    [self merge:array :start :middle :end];
}

- (void)merge:(NSMutableArray *)array :(NSNumber *)start :(NSInteger)middle :(NSNumber *)end
{
    NSMutableArray *tmpArr = [NSMutableArray arrayWithCapacity:(end.integerValue - start.integerValue + 1)];
    
    for (NSInteger i = start.integerValue; i <= end.integerValue;  i ++) {
        tmpArr[i - start.integerValue] = array[i];
    }
    
    NSInteger i = start.integerValue;
    NSInteger j = middle + 1;
    
    for (NSInteger k = start.integerValue; k <= end.integerValue; k ++) {
        if (i > middle) {
            array[k] = tmpArr[j - start.integerValue];
            j ++;
        } else if (j > end.integerValue) {
            array[k] = tmpArr[i - start.integerValue];
            i ++;
        } else if (((NSNumber *)tmpArr[i- start.integerValue]).integerValue < ((NSNumber *)tmpArr[j - start.integerValue]).integerValue) {
            array[k] = tmpArr[i - start.integerValue];
            i ++;
        } else {
            array[k] = tmpArr[j - start.integerValue];
            j ++;
        }
    }
}

@end
