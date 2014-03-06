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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
