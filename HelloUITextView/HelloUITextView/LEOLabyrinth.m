//
//  LEOLabyrinth.m
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 5/22/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import "LEOLabyrinth.h"
#import "LEOLabyrinthNode.h"
static     int hang = 5, lie=4;
@implementation LEOLabyrinth
-(id)init {
    self.mapArr = [[NSArray alloc] initWithObjects:
                   [[NSArray alloc] initWithObjects:@2,@0,@1,@1,@1, nil],
                   [[NSArray alloc] initWithObjects:@1,@0,@0,@1,@1, nil],
                   [[NSArray alloc] initWithObjects:@1,@1,@0,@1,@1, nil],
                   [[NSArray alloc] initWithObjects:@1,@1,@0,@1,@1, nil],
                   [[NSArray alloc] initWithObjects:@1,@1,@0,@0,@1, nil],
                   [[NSArray alloc] initWithObjects:@1,@1,@1,@0,@1, nil],
                   nil];
    return self;
}
-(void)printMyWay:(NSArray*)map
{
    BOOL isSuccessful = NO;
    int i=5, j=3;
    LEOLabyrinthNode *startNode = [[LEOLabyrinthNode alloc] init];
    [startNode fillPositionX:i positionY:j];
    LEOLabyrinthNode *firstNode = startNode;

    while (!isSuccessful) {
        if (!startNode.LeftNode && [self turnLeft:startNode Map:self.mapArr]) {
            startNode = startNode.LeftNode;
        }else if(!startNode.frontNode && [self turnFront:startNode Map:self.mapArr]){
            startNode = startNode.frontNode;
        }else if(!startNode.rightNode && [self turnRight:startNode Map:self.mapArr]){
            startNode = startNode.rightNode;
        }else if (!startNode.BackNode && [self turnBack:startNode Map:self.mapArr]){
            startNode = startNode.BackNode;
        }else {
            if ([[[self.mapArr objectAtIndex:startNode.positionX] objectAtIndex:startNode.positionY] integerValue] == 2){
                NSLog(@"I have found the right way");
                break;
            }

            startNode.isLiveNode = NO;
            startNode = startNode.lastNode;
        }
        
//        if ([[[self.mapArr objectAtIndex:startNode.positionX] objectAtIndex:startNode.positionY] integerValue] == 2){
//            NSLog(@"I have found the right way");
//            break;
//        }
    }
    startNode = firstNode;
    while (([[[self.mapArr objectAtIndex:startNode.positionX] objectAtIndex:startNode.positionY] integerValue] != 2)) {
        if (startNode.LeftNode.isLiveNode) {
            NSLog(@"turen left");
            startNode = startNode.LeftNode;
        }else if (startNode.rightNode.isLiveNode) {
            NSLog(@"turn right");
            startNode = startNode.rightNode;
        }else if (startNode.frontNode.isLiveNode) {
            NSLog(@"turn front");
            startNode = startNode.frontNode;
        }else if (startNode.BackNode.isLiveNode) {
            NSLog(@"turn back");
            startNode = startNode.BackNode;
        }else{
            break;
        }
    }
    
}
-(BOOL)turnLeft:(LEOLabyrinthNode*)startNode Map:(NSArray*)arr
{
    if (startNode.LeftNode) {
//        startNode = startNode.LeftNode;
        return NO;
    }
    int x=startNode.positionX;
    int y=startNode.positionY;
    y -=1;
    if (y >=0) {
        if ([[[arr objectAtIndex:x] objectAtIndex:y] integerValue] != 1) {
            LEOLabyrinthNode *node = [[LEOLabyrinthNode alloc] init];
            [node fillPositionX:x positionY:y];
            startNode.LeftNode = node;
            startNode.isLiveNode = YES;
            node.rightNode = startNode;
            node.lastNode = startNode;
            node.isLiveNode = YES;
            return YES;
        }
    }
    return NO;
}
-(BOOL)turnBack:(LEOLabyrinthNode*)startNode Map:(NSArray*)arr
{
    if (startNode.BackNode) {
        startNode = startNode.BackNode;
        return NO;
    }
    int x=startNode.positionX;
    int y=startNode.positionY;
    x +=1;
    if (x <hang) {
        if ([[[arr objectAtIndex:x] objectAtIndex:y] integerValue] != 1) {
            LEOLabyrinthNode *node = [[LEOLabyrinthNode alloc] init];
            [node fillPositionX:x positionY:y];
            startNode.frontNode = node;
            startNode.isLiveNode = YES;
            node.BackNode = startNode;
            node.lastNode = startNode;
            node.isLiveNode = YES;
            return YES;
        }
    }
    return NO;
}
-(BOOL)turnRight:(LEOLabyrinthNode*)startNode Map:(NSArray*)arr
{
    if (startNode.rightNode) {
        startNode = startNode.rightNode;
        return NO;
    }
    int x=startNode.positionX;
    int y=startNode.positionY;
    y +=1;
    if (y <lie) {
        if ([[[arr objectAtIndex:x] objectAtIndex:y] integerValue] != 1) {
            LEOLabyrinthNode *node = [[LEOLabyrinthNode alloc] init];
            [node fillPositionX:x positionY:y];
            startNode.rightNode = node;
            startNode.isLiveNode = YES;
            node.LeftNode = startNode;
            node.lastNode = startNode;
            node.isLiveNode = YES;
            return YES;
        }
    }
    return NO;
}
-(BOOL)turnFront:(LEOLabyrinthNode*)startNode Map:(NSArray*)arr
{
    if (startNode.frontNode) {
        startNode = startNode.frontNode;
        return NO;
    }
    int x=startNode.positionX;
    int y=startNode.positionY;
    x -=1;
    if (x >=0) {
        if ([[[arr objectAtIndex:x] objectAtIndex:y] integerValue] != 1) {
            LEOLabyrinthNode *node = [[LEOLabyrinthNode alloc] init];
            [node fillPositionX:x positionY:y];
            startNode.frontNode = node;
            startNode.isLiveNode = YES;
            node.BackNode = startNode;
            node.lastNode = startNode;
            node.isLiveNode = YES;
            return YES;
        }
    }
    return NO;
}
@end
