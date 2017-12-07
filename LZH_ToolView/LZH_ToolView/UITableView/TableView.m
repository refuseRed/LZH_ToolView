//
//  TableView.m
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "TableView.h"
#import "LZH_ControlClass.h"
#import "firstView.h"
#import "SecondViewXib.h"
#define Screen_W   [UIScreen mainScreen].bounds.size.width
#define Screen_H   [UIScreen mainScreen].bounds.size.height
#define ViewColor  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1]

#define topBarHeight   (([[UIApplication sharedApplication] statusBarFrame].size.height)+(self.navigationController.navigationBar.frame.size.height))

@interface TableView ()
//代码View
@property(nonatomic,strong)firstView * firstV ;
//XibView
@property(nonatomic,strong)SecondViewXib * SecondV ;
@end

@implementation TableView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"TableView" ;
    self.view.backgroundColor = [UIColor whiteColor] ;
    
  
   
    UILabel * label = [LZH_ControlClass creatLabelWithFrame:CGRectMake(Screen_W/4, topBarHeight+15, Screen_W/2, 40) title:@"首页就是我了，这里就补充一些UIView的使用吧" titleColor:[LZH_ControlClass colorWithRgb:0x483D8B] font:14 textAlignment:1 numberOfLines:0 ];
    [self.view addSubview:label ];
    
    [self.view addSubview:self.firstV ];
    [self.view addSubview:self.SecondV ];
    
}

//懒加载--代码View
-(firstView *)firstV{
    if (!_firstV) {
        _firstV = [[firstView alloc] initWithFrame:CGRectMake((Screen_W-100)/2, 150, 100, 100) ];
        _firstV.dic = @{@"number":@"1"} ;
    }
    return _firstV ;
}

//懒加载--XibView
-(SecondViewXib *)SecondV{
    if (!_SecondV) {
        _SecondV = [SecondViewXib intXibView];
        _SecondV.frame = CGRectMake((Screen_W-100)/2, 300, 100, 100) ;
        _SecondV.number = @"1" ;
    }
    return _SecondV ;
}

@end
