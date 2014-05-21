//
//  ViewController.m
//  HelloUITextView
//
//  Created by sparkfire.l.zhang on 12/31/13.
//  Copyright (c) 2013 sparkfire.l.zhang. All rights reserved.
//

#import "ViewController.h"
#import "MyTVCell.h"
#import "RiepilogoPaymentViewController.h"
#import "LeoBlock.h"
#import "LeoBook.h"
#import "LeoPractiseThread.h"
#import "LeoAnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize titleView = _titleView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 7) {
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
    
    int navBarHeight = self.navigationController.navigationBar.frame.size.height;
    int setOff = 0;
    int tableViewHeight = self.view.frame.size.height-navBarHeight;
//    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7) {
        setOff = navBarHeight+20;
        tableViewHeight = self.view.frame.size.height;
    }

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, tableViewHeight) style:UITableViewStylePlain];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [self.titleView setBackgroundColor:[UIColor blueColor]];
    for (int i=0; i<3; i++) {
        UIView* v = [[UIView alloc] initWithFrame:CGRectMake(0, 0+i*31, self.titleView.frame.size.width, 30)];
        [self.titleView addSubview:v];
        [v setBackgroundColor:[UIColor redColor]];
    }
    [self.view addSubview:self.titleView];
    
    [self testBlock];
    [self testArchive];
    [self testThread];
    [self testStringOperation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)testStringOperation {
    
    NSString* str = @"j";
    
    NSLog(@"%@",[self testUpupercaseFirstLetter:str]);
}
-(NSString*)testUpupercaseFirstLetter:(NSString*)source {
    if (!source) {
        return nil;
    }
    NSString* temp = source;
    NSString* firstLetter = [temp substringToIndex:1];
    firstLetter = [firstLetter uppercaseStringWithLocale:[NSLocale currentLocale]];
    return [NSString stringWithFormat:@"%@%@",firstLetter,[temp substringFromIndex:1]];
}
- (void)testThread {
    LeoPractiseThread * pt = [[LeoPractiseThread alloc] init];
    [pt practiseThread];
}
- (void)testArchive {
    LeoBook *book  = [[LeoBook alloc] init];
    book.name      = @"三毛流浪记";
    book.author    = @"三毛";
    book.numOfPage = [[NSNumber alloc] initWithInt:123];
    
    NSArray *paths               = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName           = [documentsDirectory stringByAppendingString:@"LeoBook"];
    
    LeoBook *sameBook            = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    if (sameBook) {
        NSLog(@"book name = @%@, author=%@, pages=%d",sameBook.name,sameBook.author,[sameBook.numOfPage intValue]);
    }else {
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsDirectory = [paths objectAtIndex:0];
//        NSString *fileName = [documentsDirectory stringByAppendingString:@"LeoBook"];
      BOOL  isSuccess = [NSKeyedArchiver archiveRootObject:book toFile:fileName];
        if (isSuccess) {
            NSLog(@" LeoBook is saved to file named LeoBook");
        }else {
            NSLog(@" Save LeoBook failed!!!");
        }
    }
}
- (void)testBlock {
    LeoBlock* block = [[LeoBlock alloc] init];
    [block practise];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"didSelectRowAtIndexPath");
    if (indexPath.row == 2) {
        LeoAnimationViewController* animation = [[LeoAnimationViewController alloc] initWithNibName:@"LeoAnimationViewController" bundle:nil];
        if (animation) {
            UINavigationController *navigationController = self.navigationController;
            [navigationController pushViewController:animation animated:YES];
            return;
        }
    }
    RiepilogoPaymentViewController *paymentVC = [[RiepilogoPaymentViewController alloc] initWithNibName:@"RiepilogoPaymentViewController" bundle:nil];
    paymentVC.deletage = self;
    UINavigationController *navigationController = self.navigationController;
    [navigationController pushViewController:paymentVC animated:YES];
    
    NSLog(@"tap this cell.index=%d",indexPath.row);
    
}

// returns nil if cell is not visible or index path is out of range
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int indexOfRow = indexPath.row;
    if (indexOfRow == 0) {
        UITableViewCell* firstCell = [tableView dequeueReusableCellWithIdentifier:@"titleSection"];
        if (firstCell) {
            return firstCell;
        }
        firstCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleSection"];
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.titleView.frame.size.width, 100)];
        [view setBackgroundColor:[UIColor yellowColor]];
        [firstCell addSubview:view];
        return firstCell;
    }
    MyTVCell *cell = nil;
    cell = (MyTVCell *)[tableView dequeueReusableCellWithIdentifier:@"MyTVCell"];
    // 如果 cell = nil , 则表示 tableView 中没有可用的闲置cell
    if(cell == nil){
        [tableView registerNib:[UINib nibWithNibName:@"MyTVCell" bundle:nil] forCellReuseIdentifier:@"MyTVCell"];
        cell = (MyTVCell *)[tableView dequeueReusableCellWithIdentifier:@"MyTVCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    }

    if (cell) {
        [cell.myButton setTitle:[NSString stringWithFormat:@"%d",indexPath.row] forState:UIControlStateNormal];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        UISwipeGestureRecognizer *recognizer;
        recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeToRight:)];
        [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [cell addGestureRecognizer:recognizer];
//        [recognizer release];
        return cell;
    }
    return nil;
}

- (void)handleSwipeToRight:(id)sender {
    NSLog(@"swipe--->");
}

/*
 recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromLeft:)];
 [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
 [[self view] addGestureRecognizer:recognizer];
 [recognizer release];
 
 recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromUp:)];
 [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
 [[self view] addGestureRecognizer:recognizer];
 [recognizer release];
 
 recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromDown:)];
 [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
 [[self view] addGestureRecognizer:recognizer];
 [recognizer release];
 */
/*
 //单指单击
 UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self
 action:@selector(handleSingleFingerEvent:)];
 singleFingerOne.numberOfTouchesRequired = 1; //手指数
 singleFingerOne.numberOfTapsRequired = 1; //tap次数
 singleFingerOne.delegate = self;
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

//UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _prevLastContentOffsetY = scrollView.contentOffset.y;
    _titlePoisionWhenMove = self.titleView.frame.origin;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat newOffsetY = scrollView.contentOffset.y ;
//    NSLog(@"newOffsetY=%f",newOffsetY);
    
    if (newOffsetY >= _prevLastContentOffsetY) {//Up
        CGFloat offsetDis = newOffsetY - _prevLastContentOffsetY;

        CGRect frame = self.titleView.frame;
        if (frame.origin.y + frame.size.height <= 0) {
            return;
        }
        frame.origin.y = _titlePoisionWhenMove.y - offsetDis;
        self.titleView.frame = frame;
        

    }
    else{//DOWN
        CGFloat offsetDis = _prevLastContentOffsetY - newOffsetY;
        CGRect frame = self.titleView.frame;
        if (frame.origin.y >= 0) {
            return;
        }
        frame.origin.y = _titlePoisionWhenMove.y + offsetDis;
        self.titleView.frame = frame;

    }
    
}
-(void)newColor:(UIColor *)newColor {
    [self.titleView setBackgroundColor:newColor];
}
@end
