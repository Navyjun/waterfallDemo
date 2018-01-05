//
//  HJCollectionFooterView.m
//  waterfallDemo
//
//  Created by 张海军 on 2018/1/5.
//  Copyright © 2018年 baoqianli. All rights reserved.
//

#import "HJCollectionFooterView.h"

@implementation HJCollectionFooterView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
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
