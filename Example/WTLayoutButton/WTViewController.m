//
//  WTViewController.m
//  WTLayoutButton
//
//  Created by huawt on 11/04/2019.
//  Copyright (c) 2019 huawt. All rights reserved.
//

#import "WTViewController.h"
#import <WTLayoutButton/WTLayoutButton.h>

@interface WTViewController ()

@end

@implementation WTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGFloat margin = 20;
    CGFloat buttonWidth = (CGRectGetWidth(self.view.frame) - 20 * 3) / 2.0;
    CGFloat buttonHeight = buttonWidth;
    
    [self addButton: [self generateButtonWithStyle:WTLayoutButtonStyleUpImageDownTitle]
          withFrame:CGRectMake(margin, 64 + margin, buttonWidth, buttonHeight)];
    
    [self addButton: [self generateButtonWithStyle:WTLayoutButtonStyleUpTitleDownImage]
          withFrame:CGRectMake(margin + buttonWidth + margin, 64 + margin, buttonWidth, buttonHeight)];
    
    [self addButton: [self generateButtonWithStyle:WTLayoutButtonStyleLeftImageRightTitle]
          withFrame:CGRectMake(margin, 64 + margin + buttonHeight + margin, buttonWidth, buttonHeight)];
    
    [self addButton: [self generateButtonWithStyle:WTLayoutButtonStyleLeftTitleRightImage]
          withFrame:CGRectMake(margin + buttonWidth + margin, 64 + margin + buttonHeight + margin, buttonWidth, buttonHeight)];
}

- (WTLayoutButton *)generateButtonWithStyle:(WTLayoutButtonStyle)style {
    WTLayoutButton *button = [WTLayoutButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"Friend"] forState:UIControlStateNormal];
    [button setTitle:@"Friend" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    button.layoutStyle = style;
    
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor magentaColor].CGColor;
    return button;
}

- (void)addButton:(WTLayoutButton *)button withFrame:(CGRect)frame {
    button.frame = frame;
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
