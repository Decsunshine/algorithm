//
//  preOrderTraverse.m
//  traverseTree
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "preOrderTraverse.h"
#import "BinaryTreeNode.h"

@implementation preOrderTraverse

- (void)recursive:(BinaryTreeNode *)root
{
    if (!root) {
        return;
    }
    NSLog(@"%ld", (long)root.value);
    [self recursive:root.leftNode];
    [self recursive:root.rightNode];
}

- (void)iteration:(BinaryTreeNode *)root
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger index = -1;
    BinaryTreeNode *node = root;
    while (node) {
        NSLog(@"%ld", (long)node.value);
        if (node.rightNode) {
            index++;
            [array insertObject:node.rightNode atIndex:index];
        }
        
        if (node.leftNode) {
            index++;
            [array insertObject:node.leftNode atIndex:index];
        }
        if (index >= 0) {
            node = array[index];
            index --;
        } else {
            break;
        }
    }
}

@end
