//
//  HomeHeaderView.m
//  FanweO2O
//
//  Created by ios on 2017/12/7.
//  Copyright © 2017年 xfg. All rights reserved.
//

#import "HomeHeaderView.h"
#import "ShowImageCell.h"
#import "CircleLayout.h"
#import "UIImageView+WebCache.h"
@interface HomeHeaderView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;


@end

@implementation HomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, width, height) collectionViewLayout:[[CircleLayout alloc] init]];
    [self.collectionView registerClass:[ShowImageCell class] forCellWithReuseIdentifier:@"identifier"];
    self.collectionView.backgroundColor = [UIColor grayColor];
    self.collectionView.delegate = self;
    [self.collectionView setContentOffset:CGPointMake(width, 0.0F)];
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ShowImageCell *cell = (ShowImageCell *)[cView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    if (!cell) return nil;
    if (self.imgArray.count) {
        NSString *imageName = self.imgArray[indexPath.row];
        if ([imageName hasPrefix:@"http"]) {
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@""]];
        }else{
            cell.imageView.image = [UIImage imageNamed:imageName];
        }
    }
//    NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",(long)indexPath.row+1];
//    cell.imageView.image = [UIImage imageNamed:imageName];
//    cell.titleLabel.text = imageName;
    return cell;
}

//给图片赋值
-(void)setImgArray:(NSArray *)imgArray{
    _imgArray = imgArray;
    [self.collectionView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float targetX = scrollView.contentOffset.x;
    scrollView.pagingEnabled = YES;
    NSInteger numCount = [self.collectionView numberOfItemsInSection:0];
    float ITEM_WIDTH = scrollView.frame.size.width;
    if (numCount>=3)
    {
        if (targetX < ITEM_WIDTH/2) {
            [scrollView setContentOffset:CGPointMake(targetX+ITEM_WIDTH *numCount, 0)];
        }
        else if (targetX >ITEM_WIDTH/2+ITEM_WIDTH *numCount)
        {
            [scrollView setContentOffset:CGPointMake(targetX-ITEM_WIDTH *numCount, 0)];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
