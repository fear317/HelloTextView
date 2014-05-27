//
//  LEOLabyrinthNode.h
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 5/22/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LEOLabyrinthNode : NSObject
{
    int _positionX;
    int _positionY;
    BOOL _isLiveNode;
}
@property (nonatomic, strong) LEOLabyrinthNode* frontNode;
@property (nonatomic, strong) LEOLabyrinthNode* BackNode;
@property (nonatomic, strong) LEOLabyrinthNode* LeftNode;
@property (nonatomic, strong) LEOLabyrinthNode* rightNode;
@property (nonatomic, strong) LEOLabyrinthNode* lastNode;
@property (assign) NSInteger positionX;
@property (assign) NSInteger positionY;
@property (assign) BOOL      isLiveNode;
-(void)fillPositionX:(int)x positionY:(int)y;

@end
