//
//  BinaryTree.h
//  traverseTree
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class BinaryTreeNode;

@interface BinaryTree : NSObject

+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values;

@end

NS_ASSUME_NONNULL_END
