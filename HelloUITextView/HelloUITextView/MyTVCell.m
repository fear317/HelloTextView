//
//  MyTVCell.m
//  HelloUITextView
//
//  Created by sparkfire.l.zhang on 12/31/13.
//  Copyright (c) 2013 sparkfire.l.zhang. All rights reserved.
//

#import "MyTVCell.h"

@implementation MyTVCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self.contentView setBackgroundColor:[UIColor yellowColor]];
        [self.myButton setTitle:@"adadas" forState:UIControlStateNormal];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)ChangeCellBackgroundColor{
    NSLog(@"ChangeCellBackgroundColor");
    [self.my_TextView resignFirstResponder];
}

-(void)changeBackgroundColor{
    [self.contentView setBackgroundColor:[UIColor blueColor]];

}

- (IBAction)btnClicked:(id)sender {
    UIButton *btn = (UIButton*)sender;
    if ([btn.superview.superview.superview.superview.superview isKindOfClass:[UITableView class]]) {
        //IOS7:UIButton-> UITableViewCellContentView-> UITableViewCellScrollView-> UITableViewCell-> UITableViewWrapperView->UITableView

        UITableView* table = btn.superview.superview.superview.superview.superview;
        NSLog(@"find uiTableView in ios7");
    }else if([btn.superview.superview.superview isKindOfClass:[UITableView class]]){
        //IOS6:UIButton-> UITableViewContentView-> UITableViewCell-> UITableView
        UITableView* table = btn.superview.superview.superview;
        NSLog(@"find UITableView in ios6");
    }
    NSLog(@"btnClicked");
    [self.my_TextView resignFirstResponder];
}
@end
