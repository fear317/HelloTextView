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
    [self practiseWithThread:@"thread1"];
    [self practiseWithAndSelectorThread:@"thread2"];
    [self practiseWithNSOperation];
    [self practiseWithDispatch];
}
-(void)practiseWithThread:(NSString*)name {
    
    [NSThread detachNewThreadSelector:@selector(practiseWithAndSelectorThread:) toTarget:self withObject:name];
}
-(void)practiseWithAndSelectorThread:(NSString*)name {
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
-(void)practiseWithNSOperation {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    LeoOperation *operation = [[LeoOperation alloc] init];
    [queue addOperation:operation];


    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doSomething:) object:@"thread3"];
    
    //    [queue addOperation:operation2]; //this is ok
    [operation2 start];
}

-(void)practiseWithDispatch {
    dispatch_queue_t myQueue;
    
    myQueue = dispatch_queue_create("MyQueue", NULL);
    
    dispatch_async(myQueue, ^{
        
        printf("Do some work here in despatch_queue.\n");
        dispatch_async(myQueue, ^{
            
            printf("work is done1 here in despatch_queue.\n");

//            dispatch_apply(6,myQueue, ^(size_t i){
//                NSInteger index = (NSInteger)i;
//                printf("%d do some work here in despatch_queue.\n",index);
//                
//            });
            printf("work is done2 here in despatch_queue.\n");

        });
        
    });
    
    dispatch_apply(6,myQueue, ^(size_t i){
        NSInteger index = (NSInteger)i;
        printf("%d do some work here in despatch_queue.\n",index);
        
    });
    
//    dispatch_release(myQueue);
}
@end
