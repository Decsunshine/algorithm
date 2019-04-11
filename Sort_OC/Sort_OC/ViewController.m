//
//  ViewController.m
//  Sort_OC
//
//  Created by lu hongliang on 2019/4/10.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "ViewController.h"
#import "QuickSort.h"
#import "MergeSort.h"
#import "HeapSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *unsortArray = [NSMutableArray arrayWithArray:@[@(2), @(12), @(6), @(49), @(57), @(17), @(46), @(9)]];

    [[HeapSort new] sort:unsortArray :@(0) :@(unsortArray.count - 1)];
    NSLog(@"%@", unsortArray);
}


@end
