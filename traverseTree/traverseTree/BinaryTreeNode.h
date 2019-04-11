//
//  BinaryTreeNode.h
//  traverseTree
//
//  Created by lu hongliang on 2019/4/11.
//  Copyright © 2019 lu hongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTreeNode : NSObject

/**
 *  值
 */
@property (nonatomic, assign) NSInteger value;
/**
 *  左节点
 */
@property (nonatomic, strong) BinaryTreeNode *leftNode;
/**
 *  右节点
 */
@property (nonatomic, strong) BinaryTreeNode *rightNode;

@end

NS_ASSUME_NONNULL_END
