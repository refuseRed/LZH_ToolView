//
//  SecondViewXib.m
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "SecondViewXib.h"

@implementation SecondViewXib

+(instancetype)intXibView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject
            ];
}

-(void)setNumber:(NSString *)number{
    _number = number ;
    self.label.text = number ;
}


@end
