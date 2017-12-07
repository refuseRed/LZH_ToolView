//
//  SecondViewXib.h
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewXib : UIView
@property(nonatomic,strong)NSString * number ;
@property (weak, nonatomic) IBOutlet UILabel *label;

+(instancetype)intXibView ;

@end
