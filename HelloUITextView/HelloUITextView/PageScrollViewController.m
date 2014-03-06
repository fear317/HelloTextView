//
//  PageScrollViewController.m
//  YSPayApp
//
//  Created by Zhang, Sparkfire L. on 11/15/13.
//  Copyright (c) 2013 Jin, Jian A. All rights reserved.
//

#import "PageScrollViewController.h"

@interface PageScrollViewController ()

//#define PAGECOUNT 3

@end

@implementation PageScrollViewController
@synthesize pageControl;
@synthesize scrollView = _scrollView;
@synthesize merchantListArr;
@synthesize timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.scrollView = [[UIScrollView alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)addImages:(NSArray*)imagesArr{

    currentPage = 1000;//timer does nothing when 000;
    
    if (self.scrollView) {
        
        for (UIView *subView in [self.scrollView subviews]) {
            if ([subView isKindOfClass:[UIImageView class]]) {
            
            [subView removeFromSuperview];
//            [subView release];
            }
        }
        [self.scrollView removeFromSuperview];
//        [scrollView release];
//        scrollView = nil;
    }
    ////////////
    //定义PageController 设定总页数，当前页，定义当控件被用户操作时,要触发的动作
    float offset = self.view.frame.size.height/10;
    CGRect pageControlFrame = CGRectMake(0,self.view.frame.size.height-offset, 320, offset);
    pageControl = [[UIPageControl alloc] initWithFrame:pageControlFrame];
    [pageControl setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin];
    pageControl.numberOfPages = 1;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];

    //////
    CGRect scrollViewFrame = self.view.frame;
    scrollViewFrame.size.height = self.view.frame.size.height-self.pageControl.frame.size.height;
    scrollViewFrame.origin.y = 0;
    self.scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    [self.scrollView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;

    //////
    imageCount    = [imagesArr count];
    pageControl.numberOfPages = imageCount;
    _scrollView.contentSize = CGSizeMake(320.0f * imageCount, scrollViewFrame.size.height);
    
    for(int i = 0; i < imageCount; i++)
    {
        
        NSString *merchantIconUrl = [imagesArr objectAtIndex:i];
        NSLog(@"pageScrollImaeUrl:%@",merchantIconUrl);
        CGRect rect = CGRectMake(i*320.0f,  0.0f, 320.0f, scrollViewFrame.size.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
        [imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        imageView.tag = i*10;
        imageView.image = [UIImage imageNamed:merchantIconUrl];
//        [YSPDataManager downloadImageBackground:merchantIconUrl withView:imageView];
        
        [self.scrollView addSubview:imageView];

    }

    [self.view addSubview:self.scrollView];
    [self.view bringSubviewToFront:pageControl];
    [self startTimer];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
    scrollViewOffset = scrollView.contentOffset.x;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
    int newOffset = scrollView.contentOffset.x;
    if (newOffset > scrollViewOffset) {
        NSLog(@"scroll to left <---");
        if (currentPage < imageCount-1) {
            
            currentPage++;
        }
    }
    else{
        NSLog(@"scroll to right --->");
        if (currentPage > 0) {
            currentPage--;
        }
    }
    pageControl.currentPage = currentPage;
}

-(void)startTimer{
    
      currentPage = -1;
    if (!timer) {
      timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    }
}
-(void)pageTurn:(UIPageControl *)aPageControl{
    
    int whichPage = aPageControl.currentPage;
    currentPage = aPageControl.currentPage;
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:0.3f];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (self.scrollView) {
        [self.scrollView setContentOffset:CGPointMake(320.0f * whichPage, 0.0f) animated:YES];
    }
    
    [UIView commitAnimations];
    
}

//定时滚动
-(void)scrollTimer{
    
    if (currentPage == 1000) {
        return;
    }
    NSLog(@"currentPage=%d",currentPage);
    NSLog(@"scrollView_size:%f_%f",_scrollView.frame.size.width,_scrollView.frame.size.height);
    NSLog(@"scrollView_content_size:%f_%f",_scrollView.contentSize.width,_scrollView.contentSize.height);
   
    currentPage++;
    if (currentPage >= imageCount) {
        currentPage = 0;
    }
    
    if (self.scrollView) {
        pageControl.currentPage = currentPage;
        [self.scrollView scrollRectToVisible:CGRectMake(currentPage * 320.0f, 0, 320.0f, self.scrollView.frame.size.height) animated:YES];

    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
