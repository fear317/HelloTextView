//
//  RiepilogoPaymentViewController.m
//  HelloUITextView
//
//  Created by sparkfire.l.zhang on 1/16/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import "RiepilogoPaymentViewController.h"

@interface RiepilogoPaymentViewController ()

@end

@implementation RiepilogoPaymentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.pageSVC =  [[PageScrollViewController alloc] initWithNibName:@"PageScrollViewController" bundle:nil];
    CGRect frame = self.pageSVC.view.frame;
    frame.origin.y = 70;
//    frame.size.height = 50;
    self.pageSVC.view.frame = frame;
    NSArray *arr = [[NSArray alloc] initWithObjects:@"Snip20131206_1.png",@"Snip20131206_3.png",@"Snip20131206_4.png",@"Snip20131206_5.png", nil];
    [self.pageSVC addImages:arr];
    [self.view addSubview:self.pageSVC.view];
    
    
    ///
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeBackgroundColorByNotification" object:nil];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(changeBackgroundColorByNotification:) name:@"changeBackgroundColorByNotification" object:nil];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(changeBackgroundColorByNotification2:) name:@"changeBackgroundColorByNotification" object:nil];
    
   NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadForNotification) object:nil];
    [thread start];
    
}
-(void)threadForNotification
{
    self.view.backgroundColor = [UIColor blackColor];

    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(changeBackgroundColor:) object:nil];
    
    [NSThread sleepForTimeInterval:3];

    [operation2 start];
    
}
-(void)changeBackgroundColor:(UIColor*)color
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeBackgroundColorByNotification" object:[UIColor redColor]];
}
-(void)changeBackgroundColorByNotification:(NSNotification*)notification
{
 UIColor *color = (UIColor*)[notification object];//获取到传递的对象
    self.view.backgroundColor = color;
}
-(void)changeBackgroundColorByNotification2:(NSNotification*)notification
{
//    UIColor *color = (UIColor*)[notification object];//获取到传递的对象
    self.view.backgroundColor = [UIColor greenColor];
}
-(void)viewWillDisappear:(BOOL)animated
{
    if (self.deletage) {
        ViewController *vc = (ViewController*)self.deletage;
        [vc newColor:[UIColor purpleColor]];
    }
    
    
    [super viewWillDisappear:animated];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
