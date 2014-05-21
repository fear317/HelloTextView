//
//  RiepilogoPaymentViewController.h
//  HelloUITextView
//
//  Created by sparkfire.l.zhang on 1/16/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageScrollViewController.h"
#import "ViewController.h"

@interface RiepilogoPaymentViewController : UIViewController

@property (nonatomic,retain) PageScrollViewController* pageSVC;
@property (nonatomic,strong) id<SendInformationDelegate> deletage;
@end
