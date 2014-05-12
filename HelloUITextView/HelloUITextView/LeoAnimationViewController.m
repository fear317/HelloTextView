//
//  LeoAnimationViewController.m
//  HelloUIView
//
//  Created by sparkfire.l.zhang on 4/21/14.
//  Copyright (c) 2014 sparkfire.l.zhang. All rights reserved.
//

#import "LeoAnimationViewController.h"

@interface LeoAnimationViewController ()

@end

@implementation LeoAnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.view1.backgroundColor = [UIColor redColor];
        if (self.view1.backgroundColor == [UIColor lightGrayColor]) {
            NSLog(@"find view1 color when init");
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.view1.backgroundColor == [UIColor lightGrayColor]) {
        NSLog(@"find view1 color when viewDidLoad");
    }
    self.view1.backgroundColor = [UIColor redColor];

//    [self animationWithColorForUIView];
//    [self animationWithTransformForUIView];
//    [self animationWithFrameForUIView];
//    [self animationSeriesImg];
//    [self animationCATransitionPubAPI];
//    [self animationExchangeSubviews];
    [self animationWithBlock];
}
-(void)animationWithColorForUIView {
    //开始动画
    [UIView beginAnimations:@"test" context:nil];
    //动画时长
    [UIView setAnimationDuration:2];
    //    [UIView setAnimationRepeatCount:2.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    /*
    *要进行动画设置的地方
    */
    
    self.view1.backgroundColor=[UIColor blueColor];
    self.view1.alpha=0.5;
    
    
    //动画结束
    [UIView commitAnimations];
    
    
}
-(void)animationWithTransformForUIView {
    
    self.view1.transform =CGAffineTransformMakeScale(0,0);//(x,y) x表示动画的起始宽度，x=1表示起始宽度与目标宽度相等，x=0.5表示起始宽度是目标宽度的50%，以此类推；y表示起始高度，赋值规则与x相同
    
    
//    CGRect frame = CGRectMake(50, 50, 200, 500);
//    [self.view1 setFrame:frame];


    [UIView beginAnimations:@"test1" context:nil];
    //动画时长
    [UIView setAnimationDuration:2];
    
    /*
     *要进行动画设置的地方
     */
    self.view1.transform = CGAffineTransformIdentity;
    
    //动画结束
    [UIView commitAnimations];
    
}
-(void)animationWithFrameForUIView {

    CGRect frame = self.view1.frame;
    frame.origin.x += 10;
    [self.view1 setFrame:frame];

    
    [UIView beginAnimations:@"test1" context:nil];
    //动画时长
    [UIView setAnimationDuration:2];
    
    /*
     *要进行动画设置的地方
     */
    frame.origin.x += 200;
    [self.view1 setFrame:frame];

    //动画结束
    [UIView commitAnimations];
    
}
-(void)animationSeriesImg {
//    连续动画:一个接一个地显示一系列的图像
    NSArray *myImages = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"Snip20131206_1.png"],
                         [UIImage imageNamed:@"Snip20131206_3.png"],
                         [UIImage imageNamed:@"Snip20131206_4.png"],
                         [UIImage imageNamed:@"Snip20131206_5.png"], nil];
    
    CGRect frame                        = self.view1.frame;
    UIImageView *myAnimatedView         = [[UIImageView alloc] initWithFrame:frame];
    
    myAnimatedView.animationImages      = myImages; //animationImages属性返回一个存放动画图片的数组
    myAnimatedView.animationDuration    = 1; //浏览整个图片一次所用的时间
    myAnimatedView.animationRepeatCount = 3; // 0 = loops forever 动画重复次数
    [myAnimatedView startAnimating];
    [self.view1 addSubview:myAnimatedView];

//    [myAnimatedView release];
}

-(void)animationCATransitionPubAPI {
//    CATransition Public API动画:
    CATransition *animation = [CATransition animation];
    //动画时间
    animation.duration = 1.0f;
    //先慢后快
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    
    //各种动画效果
    /*
     kCATransitionFade;
     kCATransitionMoveIn;
     kCATransitionPush;z
     kCATransitionReveal;
     */
    /*
     kCATransitionFromRight;
     kCATransitionFromLeft;
     kCATransitionFromTop;
     kCATransitionFromBottom;
     */
    //各种组合
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromBottom;
    
    [self.view1.layer addAnimation:animation forKey:@"animation"];
}
-(void)animationWithBlock {
    //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];//oglFlip, fromLeft

    [UIView animateWithDuration:1 //时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionTransitionFlipFromLeft//动画效果
                     animations:^{
                         
                         //动画设置区域
                         self.view2.backgroundColor=[UIColor blueColor];
                         self.view2.alpha=0.5;
                         
                     } completion:^(BOOL finish){
                         //动画结束时调用
                         //............
                         [UIView animateWithDuration:1 //时长
                                               delay:0 //延迟时间
                                             options:UIViewAnimationOptionTransitionNone//动画效果
                                          animations:^{
                                              
                                              //动画设置区域
                                              CGAffineTransform newTransform = CGAffineTransformMakeScale(1.5, 1.5);
                                              [self.view2 setTransform:newTransform];
                                              
                                          } completion:^(BOOL finish){
                                              //动画结束时调用
                                              //............
                                          }];
                     }];

}
-(void)animationExchangeSubviews {//??????
//    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
//    [UIView commitAnimations];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
