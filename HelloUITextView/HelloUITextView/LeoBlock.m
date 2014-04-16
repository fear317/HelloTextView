//
//  LeoBlock.m
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 4/15/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import "LeoBlock.h"

@implementation LeoBlock

typedef NSString* (^transferIntToString)(NSInteger);

-(void)practise {
    NSString* (^intToString)(int) = ^(int par) {
        NSString *newValue = [NSString stringWithFormat:@"%d",par];
        return newValue;
    };
    NSString* str = intToString(100);
    NSLog(@"Block practise: int_value to str_value:%@",str);
    
    NSLog(@"Block practise: int_value to str_value:%@",[self stringfromInt:23 useBlockToTransfer:intToString]);
}

-(NSString*)stringfromInt:(NSInteger)input useBlockToTransfer:(transferIntToString)blockParm {
    return blockParm(input);
}
//Block 默认存放在stack内存区，其生命周期和stack变量一致，如果想长时间保存，需要使用copy方式创建Block,此时新产生的Block位于heap内存区
@end
