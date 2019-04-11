//
//  inOrderTraverse.m
//  traverseTree
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "inOrderTraverse.h"
#import "BinaryTreeNode.h"

@implementation inOrderTraverse

- (void)recursive:(BinaryTreeNode *)root
{
    if (!root) {
        return;
    }
    [self recursive:root.leftNode];
    NSLog(@"%ld", (long)root.value);
    [self recursive:root.rightNode];
}

- (void)iteration:(BinaryTreeNode *)root
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger index = -1;
    
    BinaryTreeNode *node = root;
    while (node != nil && index >= 0) {
        if (node) {
            index = index + 1;
            [array insertObject:node atIndex:index];
            node = node.leftNode;
        } else {
            node = [array objectAtIndex:index];
            NSLog(@"%ld", (long)node.value);
            index = index - 1;
            node = node.rightNode;
        }
    }
}

@end
