//
//  HJCollectionHeaderView.m
//  waterfallDemo
//
//  Created by 张海军 on 2018/1/5.
//  Copyright © 2018年 baoqianli. All rights reserved.
//

#import "HJCollectionHeaderView.h"

@implementation HJCollectionHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor brownColor];
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}

@end
