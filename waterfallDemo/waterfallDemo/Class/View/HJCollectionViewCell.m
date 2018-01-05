//
//  HJCollectionViewCell.m
//  waterfallDemo
//
//  Created by 张海军 on 2018/1/5.
//  Copyright © 2018年 baoqianli. All rights reserved.
//

#import "HJCollectionViewCell.h"

@implementation HJCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

@end
