//
//  postOrderTraverse.m
//  traverseTree
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "postOrderTraverse.h"
#import "BinaryTreeNode.h"

@implementation postOrderTraverse

- (void)recursive:(BinaryTreeNode *)root
{
    if (!root) {
        return;
    }
    [self recursive:root.leftNode];
    [self recursive:root.rightNode];
    NSLog(@"%ld", (long)root.value);
}

- (void)iteration:(BinaryTreeNode *)root
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger index = -1;
    NSMutableArray *arrayResult = [NSMutableArray array];
    NSInteger indexResult = -1;
    
    BinaryTreeNode *node = root;
    
    while (node && index >= 0) {
        if (node) {
            indexResult = indexResult + 1;
            [arrayResult insertObject:node atIndex:indexResult];
        }
        
        if (node.leftNode) {
            index = index + 1;
            [array insertObject:node.leftNode atIndex:index];
        }
        if (node.rightNode) {
            index = index + 1;
            [array insertObject:node.rightNode atIndex:index];
        }
        
        if (index >= 0) {
            node = [array objectAtIndex:index];
            index = index - 1;
        }
    }
    
    while (indexResult >= 0) {
        NSLog(@"%@", arrayResult[indexResult]);
        indexResult = indexResult - 1;
    }
}

@end
