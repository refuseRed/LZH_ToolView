//
//  LZH_UIButton+ImageTitleSpacing.h
//  LZH_ToolClass
//
//  Created by admin  on 2017/12/4.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LZHButtonEdgeInsetsStyle) {
    LZHButtonEdgeInsetsStyleTop, // image在上，label在下
    LZHButtonEdgeInsetsStyleLeft, // image在左，label在右
    LZHButtonEdgeInsetsStyleBottom, // image在下，label在上
    LZHButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (ImageTitleSpacing)

/**
  设置button的titleLabel和imageView的布局样式，及间距
 
 参数一: titleLabel和imageView的布局样式
 参数二: titleLabel和imageView的间距
 
 */
- (void)layoutButtonWithEdgeInsetsStyle:(LZHButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
