//
//  CollectionViewCell.m
//  LZH_ToolView
//
//  Created by admin  on 2017/12/6.
//  Copyright © 2017年 刘中华. All rights reserved.
//

#import "CollectionViewCell.h"
#define ViewColor  [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1]
@interface CollectionViewCell ()

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = ViewColor ;
    }
    return self;
}


@end
