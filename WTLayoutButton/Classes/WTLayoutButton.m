//
//  WTLayoutButton.m
//  WTLayoutButton
//
//  Created by huawt on 16/9/30.
//  Copyright © 2016年 huawt. All rights reserved.
//

#import "WTLayoutButton.h"

@implementation WTLayoutButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.midSpacing = 8;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    self.midSpacing = 8;
    [super setFrame:frame];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView sizeToFit];
    [self.titleLabel sizeToFit];
    
    switch (self.layoutStyle) {
        case WTLayoutButtonStyleLeftImageRightTitle:
            [self layoutHorizontalWithLeftView:self.imageView rightView:self.titleLabel];
            break;
        case WTLayoutButtonStyleLeftTitleRightImage:
            [self layoutHorizontalWithLeftView:self.titleLabel rightView:self.imageView];
            break;
        case WTLayoutButtonStyleUpImageDownTitle:
            [self layoutVerticalWithUpView:self.imageView downView:self.titleLabel];
            break;
        case WTLayoutButtonStyleUpTitleDownImage:
            [self layoutVerticalWithUpView:self.titleLabel downView:self.imageView];
            break;
        default:
            break;
    }
}

- (void)layoutHorizontalWithLeftView:(UIView *)leftView rightView:(UIView *)rightView {
    CGRect leftViewFrame = leftView.frame;
    CGRect rightViewFrame = rightView.frame;
    
    CGFloat totalWidth = CGRectGetWidth(leftViewFrame) + self.midSpacing + CGRectGetWidth(rightViewFrame);
    
    leftViewFrame.origin.x = (CGRectGetWidth(self.frame) - totalWidth) / 2.0;
    leftViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(leftViewFrame)) / 2.0;
    leftView.frame = leftViewFrame;
    
    rightViewFrame.origin.x = CGRectGetMaxX(leftViewFrame) + self.midSpacing;
    rightViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(rightViewFrame)) / 2.0;
    rightView.frame = rightViewFrame;
}

- (void)layoutVerticalWithUpView:(UIView *)upView downView:(UIView *)downView {
    CGRect upViewFrame = upView.frame;
    CGRect downViewFrame = downView.frame;
    
    CGFloat totalHeight = CGRectGetHeight(upViewFrame) + self.midSpacing + CGRectGetHeight(downViewFrame);
    
    upViewFrame.origin.y = (CGRectGetHeight(self.frame) - totalHeight) / 2.0;
    upViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(upViewFrame)) / 2.0;
    upView.frame = upViewFrame;
    
    downViewFrame.origin.y = CGRectGetMaxY(upViewFrame) + self.midSpacing;
    downViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(downViewFrame)) / 2.0;
    downView.frame = downViewFrame;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self setNeedsLayout];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self setNeedsLayout];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
