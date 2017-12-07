//
//  ViewController.m
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "ViewController.h"
#define Screen_W   [UIScreen mainScreen].bounds.size.width
#define Screen_H   [UIScreen mainScreen].bounds.size.height

#define ViewColor  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1]

//三个控制器
#import "ScrollView.h"
#import "TableView.h"
#import "CollectionView.h"
//XibView
#import "SecondViewXib.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)UITableView * tableView ;
//数据
@property (nonatomic , strong)NSArray * dataArr ;
//XibView
@property(nonatomic,strong)SecondViewXib * SecondV ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页" ;
    [self.view addSubview:self.tableView ];
    self.dataArr = @[@"UIScrollview",@"UITableView",@"UICollectionView"] ;
}

//设置组的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2 ;
}

//设置cell的行数，默认一组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {//第一组数量
        return 1 ;
    }
    //第二组数量
    return self.dataArr.count;
}

//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {//第一组高度
        return 60 ;
    }
    //第二组高度
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {//第一组cell
        NSString * cellIndex = @"cell" ;
        //用TableSampleIdentifier表示需要重用的单元
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndex];
        if (!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndex];
            cell.backgroundColor = [UIColor redColor] ;
            cell.textLabel.text = @"我是第一组的cell不是头部" ;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;//选中时设置cell的背景色
        return cell ;
    }
    //第二组cell
    NSString * cellIndex = @"cell" ;
    //用TableSampleIdentifier表示需要重用的单元
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndex];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndex];
        cell.textLabel.text = self.dataArr[indexPath.row] ;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//选中时设置cell的背景色
    return cell ;
}

//cell的点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {//第一组点击事件
        NSLog(@"没有事件执行") ;
    }else{//第二组点击事件
        if (indexPath.row==0) {
            ScrollView * sc = [[ScrollView alloc]init ];
            [self.navigationController pushViewController:sc animated:YES ];
        }else if (indexPath.row==1) {
            TableView * tc = [[TableView alloc]init ];
            [self.navigationController pushViewController:tc animated:YES ];
        }else if (indexPath.row==2) {
            CollectionView * cc = [[CollectionView alloc]init ];
            [self.navigationController pushViewController:cc animated:YES ];
        }
        
    }
}

//设置头部的宽度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
        return 0.1f ;
}

//头部View
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView * view = [[UIView alloc]init ] ;
    view.backgroundColor = [UIColor clearColor] ;
    return view;
    
}

//设置尾部的宽度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {//第一组的高度
        return 0.1f;
    }
    //第二组的高度
    return 40;
}

//头部View
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return self.SecondV;
    
}



//懒加载tableView
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_W,Screen_H) style:(UITableViewStyleGrouped)];
        //背景
        _tableView.backgroundColor = [UIColor whiteColor];
        //代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //滚动条
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        //cell分割线得样式
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView ;
}

//懒加载--XibView
-(SecondViewXib *)SecondV{
    if (!_SecondV) {
        _SecondV = [SecondViewXib intXibView];
        _SecondV.number = @"我是第二组的Footer" ;
    }
    return _SecondV ;
}

@end
