//
//  LZH_ControlClass.m
//  LZH_ToolClass
//
//  Created by admin  on 2017/12/4.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "LZH_ControlClass.h"

@implementation LZH_ControlClass

#pragma mark 将16进制颜色值转换为UIColor
+ (UIColor*) colorWithRgb:(int)color {
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:1];
}

#pragma mark--横线+透明度
+ (float)createLineX:(float)X y:(float)Y width:(float)width height:(float)height color:(UIColor *)color superView:(UIView*)view alpha:(float)alpha
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(X, Y, width, height)];
    line.backgroundColor = color;
    [view addSubview:line];
    line.alpha = alpha ;
    return CGRectGetMaxY(line.frame);
}

#pragma mark--按钮_UIButton

+ (UIButton *)creatBtnWithFrame:(CGRect)frame btnTitle:(NSString *)titleString btnTitleColor:(UIColor *)color btnTitleFont:(int)font btnSetImage:(UIImage *)image btnBackgroundColor:(UIColor *)BGcolor backgroundImage:(UIImage *)backgrImage  isCorner:(BOOL)corner
{
    
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:titleString forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setImage:image forState:UIControlStateNormal];
    button.backgroundColor = BGcolor;
    [button setBackgroundImage:backgrImage forState:UIControlStateNormal];
    if (corner) {
        button.layer.cornerRadius = button.frame.size.height/2;
        button.clipsToBounds = YES;
    }
    return button;
}


#pragma mark--文字UILabel
//常规文字
+ (UILabel *)creatLabelWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor *)color font:(int)font textAlignment:(NSTextAlignment)alignment numberOfLines:(int)numberOfLines
{
    UILabel * Label = [[UILabel alloc]initWithFrame:frame];
    Label.text = title;
    Label.font = [UIFont systemFontOfSize:font];
    Label.textColor = color;
    Label.textAlignment = alignment;
    Label.numberOfLines = numberOfLines ;
    return Label;
}

//自适应宽度
+ (UILabel *)creatLabelWithTitle:(NSString*)title titleColor:(UIColor *)color font:(int)font titleX:(CGFloat)titlex titleY:(CGFloat)titley addW:(CGFloat)addw titleH:(CGFloat)titleH BackgroundColor:(UIColor *)BGcolor isCorner:(BOOL)corner textAlignment:(NSTextAlignment)alignment{
    
    UILabel * Label_W = [[UILabel alloc]init];
    Label_W.backgroundColor = BGcolor ;
    Label_W.text = title;
    Label_W.textColor = color ;
    Label_W.textAlignment = alignment ;
    UIFont *f = [UIFont systemFontOfSize:font];
    Label_W.font = f;
    // 根据字体得到NSString的尺寸
    CGSize size = [Label_W.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:f,NSFontAttributeName,nil]];
    //    CGFloat nameH = size.height;
    CGFloat nameW = size.width+addw;
    Label_W.frame = CGRectMake(titlex,titley, nameW,titleH);
    if (corner) {
        Label_W.layer.cornerRadius = Label_W.frame.size.height/2;
        Label_W.layer.masksToBounds = YES;
    }
    return Label_W;
    
}

#pragma mark--图片_UIImageView
+ (UIImageView *)creatImageVeiwWithFrame:(CGRect)rect imageName:(NSString *)imageName isCorner:(BOOL)isCorner
{
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:rect];
    imageV.image = [UIImage imageNamed:imageName];
    if (isCorner) {
        imageV.layer.cornerRadius = imageV.frame.size.width/2;
        imageV.layer.masksToBounds = YES;
    }
    return imageV;
}


+(UITextField *)creatTextFieldWithFrame:(CGRect)rect PlaceHold:(NSString *)placehold PlaceHoldColor:(UIColor *)color TitleFont:(int)font BackgroundColor:(UIColor *)BGcolor KeyboardType:(UIKeyboardType)keyboardType  isCorner:(BOOL)corner {
    
    UITextField *textField= [[UITextField alloc]initWithFrame:rect];
    textField.placeholder = placehold;
    [textField setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    textField.font = [UIFont systemFontOfSize:font];
    textField.backgroundColor = BGcolor;
    textField.keyboardType = keyboardType;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    if (corner) {
        textField.layer.cornerRadius = 4;
        textField.clipsToBounds = YES;
    }
    return  textField;
}

@end

