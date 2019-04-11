//
//  ViewController.m
//  traverseTree
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTree.h"
#import "BinaryTreeNode.h"
#import "preOrderTraverse.h"
#import "inOrderTraverse.h"
#import "postOrderTraverse.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@(36), @(51), @(34), @(9), @(20)];
    BinaryTreeNode *root = [BinaryTree createTreeWithValues:array];
    
//    [[preOrderTraverse new] recursive:root];
//    [[inOrderTraverse new] recursive:root];
//    [[postOrderTraverse new] recursive:root];
//

//    [[preOrderTraverse new] iteration:root];
//    [[inOrderTraverse new] recursive:root];
    [[postOrderTraverse new] recursive:root];
}



@end
