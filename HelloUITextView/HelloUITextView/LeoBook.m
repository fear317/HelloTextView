//
//  LeoBook.m
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 4/17/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import "LeoBook.h"

@implementation LeoBook

-(id)initWithCoder:(NSCoder*)aDecoder {
    
    self.name      = [aDecoder decodeObjectForKey:@"LeoBook_name"];
    self.author    = [aDecoder decodeObjectForKey:@"LeoBook_author"];
    self.numOfPage = [aDecoder decodeObjectForKey:@"LeoBook_numOfPage"];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"LeoBook_name"];
    [aCoder encodeObject:self.author forKey:@"LeoBook_author"];
    [aCoder encodeObject:self.numOfPage forKey:@"LeoBook_numOfPage"];
}
@end
