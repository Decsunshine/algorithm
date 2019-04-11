//
//  HeapSort.m
//  Sort_OC
//
//  Created by lu hongliang on 2019/4/10.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "HeapSort.h"

@implementation HeapSort

- (void)sort:(NSMutableArray *)array :(NSNumber *)start :(NSNumber *)end
{
    if (start.integerValue > end.integerValue) {
        return;
    }
   
    NSInteger count = end.integerValue - start.integerValue + 1;
    for (NSInteger i =  count / 2 - 1; i >= 0; i --) {
        [self adjustHeap:array count:count index:i];
    }
    
    for (NSInteger i = end.integerValue; i > 0; i --) {
        [self swap:array :@(i) :@(0)];
        count = count - 1;
        [self adjustHeap:array count:count index:0];
    }
}

- (void)adjustHeap:(NSMutableArray *)array count:(NSInteger)count index:(NSInteger)index
{
    while (2 * index + 1 < count) {
        NSUInteger j = 2 * index + 1;
        if ((j + 1 < count) && (((NSNumber *)array[j]).integerValue < ((NSNumber *)array[j + 1]).integerValue)) {
            j ++;
        }
        if (((NSNumber *)array[index]).integerValue > ((NSNumber *)array[j]).integerValue) {
            break;
        }
        [self swap:array :@(index) :@(j)];
        index = j;
    }
}

- (void)swap:(NSMutableArray *)array :(NSNumber *)one :(NSNumber *)two
{
    NSNumber *tmp = array[one.intValue];
    array[one.intValue] = array[two.intValue];
    array[two.intValue] = tmp;
}

@end
