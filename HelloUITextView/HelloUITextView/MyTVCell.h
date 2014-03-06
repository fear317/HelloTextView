//
//  MyTVCell.h
//  HelloUITextView
//
//  Created by sparkfire.l.zhang on 12/31/13.
//  Copyright (c) 2013 sparkfire.l.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTVCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *my_TextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *myButton;
- (IBAction)btnClicked:(id)sender;
-(void)ChangeCellBackgroundColor;
-(void)changeBackgroundColor;
@end
