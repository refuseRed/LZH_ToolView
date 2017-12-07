//
//  ScrollView.m
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "ScrollView.h"
#import "SecondViewXib.h"
#define Screen_W   [UIScreen mainScreen].bounds.size.width
#define Screen_H   [UIScreen mainScreen].bounds.size.height
#define ViewColor  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1]

#define topBarHeight   (([[UIApplication sharedApplication] statusBarFrame].size.height)+(self.navigationController.navigationBar.frame.size.height))

@interface ScrollView ()

@property (nonatomic , strong) UIScrollView *scrollView;
//XibView
@property(nonatomic,strong)SecondViewXib * SecondV ;

@end

@implementation ScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    self.navigationItem.title = @"ScrollView" ;
    [self.view addSubview:self.scrollView ];
    [self.scrollView addSubview:self.SecondV ];
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(15, topBarHeight+15, Screen_W-30, Screen_H-30-topBarHeight)];
        _scrollView.backgroundColor = ViewColor;
        // 隐藏水平滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = YES;
        //设置滚动
        _scrollView.contentSize = CGSizeMake(0, Screen_H+topBarHeight);
    }
        return _scrollView ;
}

//懒加载--XibView
-(SecondViewXib *)SecondV{
    if (!_SecondV) {
        _SecondV = [SecondViewXib intXibView];
        _SecondV.frame = CGRectMake(0, (_scrollView.frame.size.height-30)/2, Screen_W, 30) ;
        _SecondV.number = @"我在滑动，动次动次动次" ;
    }
    return _SecondV ;
}

@end
