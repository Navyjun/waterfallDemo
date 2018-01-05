//
//  ViewController.m
//  waterfallDemo
//
//  Created by 张海军 on 2018/1/5.
//  Copyright © 2018年 baoqianli. All rights reserved.
//

#import "ViewController.h"
#import "HJCollectionViewWaterfallLayout.h"
#import "HJCollectionViewCell.h"
#import "HJCollectionHeaderView.h"
#import "HJCollectionFooterView.h"

@interface ViewController ()
<UICollectionViewDataSource,
UICollectionViewDataSource,
HJCollectionViewWaterfallLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imgArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"waterfall";
    self.view.backgroundColor = [UIColor whiteColor];
    
    HJCollectionViewWaterfallLayout *waterfallLayout = [[HJCollectionViewWaterfallLayout alloc] init];
    waterfallLayout.delegate = self;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfallLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[HJCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HJCollectionViewCell class])];
    [self.collectionView registerClass:[HJCollectionHeaderView class]
        forSupplementaryViewOfKind:HJElementKindSectionHeader
               withReuseIdentifier:NSStringFromClass([HJCollectionHeaderView class])];
    [self.collectionView registerClass:[HJCollectionFooterView class]
            forSupplementaryViewOfKind:HJElementKindSectionFooter
                   withReuseIdentifier:NSStringFromClass([HJCollectionFooterView class])];
    
    [self.view addSubview:self.collectionView];
    
    self.imgArray = @[@"IMG_1.JPG", @"IMG_2.JPG", @"IMG_3.JPG", @"IMG_4.JPG"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collection view data source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (section + 1) * 2;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HJCollectionViewCell class])
                                                                                forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.imgArray[indexPath.item % 4]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:HJElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:NSStringFromClass([HJCollectionHeaderView class])
                                                                 forIndexPath:indexPath];
        if ([reusableView isKindOfClass:[HJCollectionHeaderView class]]) {
            HJCollectionHeaderView *headerView = (HJCollectionHeaderView *)reusableView;
            headerView.titleLabel.text = [NSString stringWithFormat:@"第%zd组--头部视图",indexPath.section];
        }
    } else if ([kind isEqualToString:HJElementKindSectionFooter]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:NSStringFromClass([HJCollectionFooterView class])
                                                                 forIndexPath:indexPath];
        if ([reusableView isKindOfClass:[HJCollectionFooterView class]]) {
            HJCollectionFooterView *footerView = (HJCollectionFooterView *)reusableView;
            footerView.titleLabel.text = [NSString stringWithFormat:@"第%zd组--尾部视图",indexPath.section];
        }
    }
    
    return reusableView;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout


/**
 item size
 */
- (CGSize)hj_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *image = [UIImage imageNamed:self.imgArray[indexPath.item % 4]];
    return image.size;
}

/**
 每组单行的排布个数
 */
- (NSInteger)hj_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout columCountAtSection:(NSInteger)section{
    return (section + 1);
}


/**
 每组头部视图的高度
 */
- (CGFloat)hj_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout heightForHeaderAtSection:(NSInteger)section{
    return 30;
}
/**
 每组尾部视图的高度
 */
- (CGFloat)hj_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout heightForFooterAtSection:(NSInteger)section{
    return 30;
}

/**
 每组的UIEdgeInsets
 */
- (UIEdgeInsets)hj_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSection:(NSInteger)section{
    return UIEdgeInsetsZero;
}

/**
 每组的minimumLineSpacing 行与行之间的距离
 */
- (CGFloat)hj_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSection:(NSInteger)section{
    return (10 - section + 0.5);
}

/**
 每组的minimumInteritemSpacing 同一行item之间的距离
 */
- (CGFloat)hj_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSection:(NSInteger)section{
    return (10 - section + 0.5);
}




@end
