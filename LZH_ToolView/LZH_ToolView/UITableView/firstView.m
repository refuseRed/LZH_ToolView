//
//  firstView.m
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "firstView.h"
#import "LZH_ControlClass.h"

@interface firstView ()
@property(nonatomic,strong)UILabel * label ;
@end

@implementation firstView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor] ;
        [self addSubview:self.label ];
    }
    return self;
}

-(void)setDic:(NSDictionary *)dic{
    _dic = dic ;
    self.label.text = dic[@"number"];
    
}

-(UILabel*)label{
    if (!_label) {
        _label = [LZH_ControlClass creatLabelWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) title:@"" titleColor:[UIColor greenColor] font:20 textAlignment:1 numberOfLines:0 ];
    }
    return _label ;
}

@end
