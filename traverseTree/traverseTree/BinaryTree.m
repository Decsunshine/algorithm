//
//  BinaryTree.m
//  traverseTree
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import "BinaryTree.h"
#import "BinaryTreeNode.h"

@implementation BinaryTree

+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values {
    BinaryTreeNode *A = [[BinaryTreeNode alloc] init];
    A.value = 18;
    BinaryTreeNode *B = [[BinaryTreeNode alloc] init];
    B.value = 29;
    BinaryTreeNode *C = [[BinaryTreeNode alloc] init];
    C.value = 9;
    BinaryTreeNode *D = [[BinaryTreeNode alloc] init];
    D.value = 63;
    BinaryTreeNode *E = [[BinaryTreeNode alloc] init];
    E.value = 5;
    BinaryTreeNode *F = [[BinaryTreeNode alloc] init];
    F.value = 56;
    BinaryTreeNode *G = [[BinaryTreeNode alloc] init];
    G.value = 37;
    A.leftNode = B;
    A.rightNode = C;
    B.leftNode = D;
    B.rightNode = E;
    D.leftNode = F;
    C.rightNode = G;

    
    /*
    BinaryTreeNode *root = nil;
    for (NSInteger i = 0; i < values.count; i++) {
        NSInteger value = [(NSNumber *)[values objectAtIndex:i] integerValue];
        root = [BinaryTree addTreeNode:root value:value];
    }
     */
    return A;
}

/**
 *  向二叉排序树节点添加一个节点
 *
 *  @param treeNode 根节点
 *  @param value    值
 *
 *  @return 根节点
 */
+ (BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)treeNode value:(NSInteger)value {
    //根节点不存在，创建节点
    if (!treeNode) {
        treeNode = [BinaryTreeNode new];
        treeNode.value = value;
    }
    else if (value <= treeNode.value) {
        //值小于根节点，则插入到左子树
        treeNode.leftNode = [BinaryTree addTreeNode:treeNode.leftNode value:value];
    }
    else {
        //值大于根节点，则插入到右子树
        treeNode.rightNode = [BinaryTree addTreeNode:treeNode.rightNode value:value];
    }
    
    return treeNode;
}

@end
