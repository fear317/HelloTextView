//
//  LeoPractiseThread.m
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 4/17/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import "LeoPractiseThread.h"
#import "LeoOperation.h"

@implementation LeoPractiseThread

-(void)practiseThread {
    [self practiseThread1:@"thread1"];
    [self practiseThread2:@"thread2"];
    [self practiseThread3];
}
-(void)practiseThread1:(NSString*)name {
    
    [NSThread detachNewThreadSelector:@selector(practiseThread2:) toTarget:self withObject:name];
}
-(void)practiseThread2:(NSString*)name {
//    NSAutoreleasePool *pool = nil;
    NSThread *myThread = [[NSThread alloc] initWithTarget:self selector:@selector(doSomething:) object:name];
    [myThread start];
    while (!myThread.isFinished) {
        NSLog(@"%@ is not finished",name);
    }
    
    [myThread cancel];
    NSLog(@"%@ is canceled",name);
}
-(void)doSomething:(NSString *)name {
    NSLog(@"fruit fruit fruit fruit fruit=%@",name);
}
-(void)practiseThread3 {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    LeoOperation *operation = [[LeoOperation alloc] init];
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doSomething:) object:@"thread3"];
//    [operation2 performSelector:@selector(doSomething:) withObject:@"thread3"];
    
    [queue addOperation:operation];

//    [queue addOperation:operation2];
    [operation2 start];
}
@end
