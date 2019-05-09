//
//  ViewController.m
//  random5_13
//
//  Created by lu hongliang on 2019/4/30.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 已知一个 random [ 0 ~ 5 ] 的函数，求一个 random [ 0 ~ 13 ] 的函数

- (void)viewDidLoad {
    [super viewDidLoad];
    int a0 = 0;
    int a1 = 0;
    int a2 = 0;
    int a3 = 0;
    int a4 = 0;
    int a5 = 0;
    int a6 = 0;
    int a7 = 0;
    int a8 = 0;
    int a9 = 0;
    int a10 = 0;
    int a11 = 0;
    int a12 = 0;
    int a13 = 0;
    
    for (int i = 0; i < 100000; i ++) {
        int j = [self random13];
        if (j == 0) {
            a0 = a0 + 1;
        } else if (j == 1) {
            a1 = a1 + 1;
        } else if (j == 2) {
            a2 = a2 + 1;
        } else if (j == 3) {
            a3 = a3 + 1;
        } else if (j == 4) {
            a4 = a4 + 1;
        } else if (j == 5) {
            a5 = a5 + 1;
        } else if (j == 6) {
            a6 = a6 + 1;
        } else if (j == 7) {
            a7 = a7 + 1;
        } else if (j == 8) {
            a8 = a8 + 1;
        } else if (j == 9) {
            a9 = a9 + 1;
        } else if (j == 10) {
            a10 = a10 + 1;
        } else if (j == 11) {
            a11 = a11 + 1;
        } else if (j == 12) {
            a12 = a12 + 1;
        } else if (j == 13) {
            a13 = a13 + 1;
        }
    }
    
    NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

- (int)random5
{
    return arc4random() % 6;
}

- (int)random13
{
    int result = 0;
    while (result < 22) {
        result = ([self random5] * 6 + [self random5]);
    }
    return result % 14;
}



@end
