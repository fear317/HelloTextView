//
//  ViewController.h
//  HelloUITextView
//
//  Created by sparkfire.l.zhang on 12/31/13.
//  Copyright (c) 2013 sparkfire.l.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageScrollViewController.h"
#import "RiepilogoPaymentViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, UIScrollViewDelegate,SendInformationDelegate>{
    CGFloat    _prevContentOffsetY;
    CGFloat    _prevTitleViewLayoutY;
    CGFloat    _prevLastContentOffsetY;
    CGPoint    startPoint;
    CGPoint    imgViewTop;
    CGPoint    _titlePoisionWhenMove;
}

@property (retain,nonatomic) UITableView *tableView;
@property (retain,nonatomic) UIView* titleView;
-(void)newColor:(UIColor *)newColor;
@end
