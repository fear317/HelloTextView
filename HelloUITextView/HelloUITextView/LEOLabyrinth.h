//
//  LEOLabyrinth.h
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 5/22/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LEOLabyrinth : NSObject
@property (nonatomic, strong) NSArray* mapArr;
-(void)printMyWay:(NSArray*)map;
@end
