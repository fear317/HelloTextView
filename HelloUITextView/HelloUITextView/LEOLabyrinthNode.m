//
//  LEOLabyrinthNode.m
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 5/22/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import "LEOLabyrinthNode.h"

@implementation LEOLabyrinthNode
@synthesize positionX  = _positionX;
@synthesize positionY  = _positionY;
@synthesize isLiveNode = _isLiveNode;

-(void)fillPositionX:(int)x positionY:(int)y
{
    _positionX = x;
    _positionY = y;
}

@end
