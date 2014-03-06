//
//  PageScrollViewController.h
//  YSPayApp
//
//  Created by Zhang, Sparkfire L. on 11/15/13.
//  Copyright (c) 2013 Jin, Jian A. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageScrollViewController : UIViewController<UIScrollViewDelegate>
{
    int currentPage;
    int imageCount;
    int scrollViewOffset;
    UIScrollView   *_scrollView;
}

@property (nonatomic, retain) UIPageControl  *pageControl;
@property (nonatomic, retain) UIScrollView   *scrollView;
@property (nonatomic, retain) NSMutableArray *merchantListArr;
@property (nonatomic, retain) NSTimer        *timer;

- (void)addImages:(NSArray*)imagesArr;
//-(void)startTimer;
@end
