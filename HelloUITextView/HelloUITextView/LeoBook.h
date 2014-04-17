//
//  LeoBook.h
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 4/17/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeoBook : NSObject<NSCoding>
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *author;
@property (nonatomic, retain) NSNumber *numOfPage;
@end
