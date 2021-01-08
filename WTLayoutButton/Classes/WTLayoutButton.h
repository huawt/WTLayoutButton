//
//  WTLayoutButton.h
//  WTLayoutButton
//
//  Created by huawt on 16/9/30.
//  Copyright © 2016年 huawt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WTLayoutButtonStyle) {
    WTLayoutButtonStyleLeftImageRightTitle,
    WTLayoutButtonStyleLeftTitleRightImage,
    WTLayoutButtonStyleUpImageDownTitle,
    WTLayoutButtonStyleUpTitleDownImage
};

/// 重写layoutSubviews的方式实现布局，忽略imageEdgeInsets、titleEdgeInsets和contentEdgeInsets
@interface WTLayoutButton : UIButton

/// 布局方式
@property (nonatomic, assign) IBInspectable WTLayoutButtonStyle layoutStyle;
@property (nonatomic, assign) IBInspectable NSInteger layoutStyleAdapter;
/// 图片和文字的间距，默认值8
@property (nonatomic, assign) IBInspectable CGFloat midSpacing;
@end

