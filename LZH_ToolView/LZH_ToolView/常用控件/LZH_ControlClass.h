//
//  LZH_ControlClass.h
//  LZH_ToolClass
//
//  Created by admin  on 2017/12/4.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LZH_ControlClass : NSObject

#pragma mark 将16进制颜色值转换为UIColor
+ (UIColor*) colorWithRgb:(int)color;

#pragma mark--横线+透明度

/**
 
 参数一:    x
 参数二:    y
 参数三:    width
 参数四:    height
 参数五:    color
 参数六:    添加的View
 参数七:    alpha
 
 */
+ (float)createLineX:(float)X y:(float)Y width:(float)width height:(float)height color:(UIColor *)color superView:(UIView*)view alpha:(float)alpha;

#pragma mark--按钮_UIButton

/**
   文字+图片
 参数一:    frame
 参数二:    按钮文字
 参数三:    按钮文字 Color
 参数四:    按钮文字 Font
 参数五:    按钮图片
 参数六:    按钮背景 Color
 参数七:    按钮背景图片
 参数八:    是否裁剪边缘
 参数九:    点击事件回调block
 
 */
+ (UIButton *)creatBtnWithFrame:(CGRect)frame btnTitle:(NSString *)titleString btnTitleColor:(UIColor *)color btnTitleFont:(int)font btnSetImage:(UIImage *)image btnBackgroundColor:(UIColor *)BGcolor backgroundImage:(UIImage *)backgrImage isCorner:(BOOL)corner ;


#pragma mark--文字_UILabel

/**
常规文字
 参数一:    frame
 参数二:    文字
 参数三:    文字 Color
 参数四:    文字 Font
 参数五:    内容位置
 参数六:    文字行数

 */
+ (UILabel *)creatLabelWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor *)color font:(int)font textAlignment:(NSTextAlignment)alignment numberOfLines:(int)numberOfLines;

/**
 自适应宽度，可单独加宽度
 参数一:    文字
 参数二:    文字 Color
 参数三:    文字 Font
 参数四:    文字 X位置
 参数五:    文字 Y位置
 参数六:    文字宽度自适应后可自行增加
 参数七:    文字高度
 参数八:    文字背景Color
 参数九:    是否裁剪边缘
 参数十:    内容位置
 
 */
+ (UILabel *)creatLabelWithTitle:(NSString*)title titleColor:(UIColor *)color font:(int)font titleX:(CGFloat)titlex titleY:(CGFloat)titley addW:(CGFloat)addw titleH:(CGFloat)titleH BackgroundColor:(UIColor *)BGcolor isCorner:(BOOL)corner textAlignment:(NSTextAlignment)alignment ;

#pragma mark--图片_UIImageView

/**
 
 参数一:    frame
 参数二:    图片
 参数三:    是否裁剪边缘

 */
+ (UIImageView *)creatImageVeiwWithFrame:(CGRect)rect imageName:(NSString *)imageName isCorner:(BOOL)isCorner;

#pragma mark--文本框_UITextField

/**
 
 参数一:    frame
 参数二:    占位文字
 参数三:    占位文字 color
 参数四:    背景颜色
 参数五:    键盘样式
 参数六:    是否裁剪边缘
 
 */
+(UITextField *)creatTextFieldWithFrame:(CGRect)rect PlaceHold:(NSString *)placehold PlaceHoldColor:(UIColor *)color TitleFont:(int)font BackgroundColor:(UIColor *)BGcolor KeyboardType:(UIKeyboardType)keyboardType  isCorner:(BOOL)corner;

@end
