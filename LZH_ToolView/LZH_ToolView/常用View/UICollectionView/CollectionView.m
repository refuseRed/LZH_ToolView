//
//  CollectionView.m
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "CollectionView.h"
#import "CollectionViewCell.h"
#import "CollectionViewXIBCell.h"

#import "firstView.h"
#define Screen_W   [UIScreen mainScreen].bounds.size.width
#define Screen_H   [UIScreen mainScreen].bounds.size.height
#define ViewColor  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1]

#define topBarHeight   (([[UIApplication sharedApplication] statusBarFrame].size.height)+(self.navigationController.navigationBar.frame.size.height))


@interface CollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic , strong) UICollectionView *collectionView;
//头部
@property (nonatomic , strong) UICollectionReusableView *headView ;
//代码View
@property(nonatomic,strong)firstView * firstV ;
@end

@implementation CollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CollectionView" ;
    self.view.backgroundColor = [UIColor whiteColor] ;
    [self.view addSubview:self.collectionView ];
}

//返回cell的个数，默认一组
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

//加载cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

//cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

// 设置头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    
  return CGSizeMake(Screen_W, 40);
}

//创建头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {

    self.headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionViewHeader" forIndexPath:indexPath];
    self.headView.backgroundColor = [UIColor redColor] ;
    
    for (UIView *view in self.headView.subviews) {
        if (view) {
            [view removeFromSuperview];
        }
    }
    [self.headView addSubview:self.firstV ];
    return self.headView;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        //创建layer层
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置同行之间cell的间隙
        layout.minimumInteritemSpacing = 10;
        //设置两行之间的间隙
        layout.minimumLineSpacing = 10;
        //设置每个cell距离上下左右之间的间隙
//        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        /*
         minimumInteritemSpacing ，minimumLineSpacing 和 sectionInset不用同时设置就可以规范间距，实际需要按开发样式使用
         */
        //设置cell的宽高
        layout.itemSize = CGSizeMake(100, 100);
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //创建UICollectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Screen_W, Screen_H) collectionViewLayout:layout];
        //设置背景
        _collectionView.backgroundColor = [UIColor clearColor];
        //设置是否可以滚动
        _collectionView.scrollEnabled = NO;
        // 取消弹簧效果
        _collectionView.bounces = NO;
        //代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //注册cell   ->代码cell
        [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        //注册cell   ->XIBcell
//        [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewXIBCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
        //创建头部视图
          [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionViewHeader"];
        
        //滚动条
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
    }
    return _collectionView ;
}

//懒加载--代码View
-(firstView *)firstV{
    if (!_firstV) {
        _firstV = [[firstView alloc] initWithFrame:CGRectMake(0, 0, Screen_W, 40) ];
        _firstV.dic = @{@"number":@"我是collectionView的头部视图"} ;
    }
    return _firstV ;
}

@end
