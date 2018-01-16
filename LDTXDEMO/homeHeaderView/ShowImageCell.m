//
//  ShowImageCell.m
//  UICollectionViewDemo
//
//  Created by 卢鹏肖 on 16/1/7.
//  Copyright © 2016年 com.shuai. All rights reserved.
//


#import "ShowImageCell.h"

@implementation ShowImageCell
@synthesize imageView;
@synthesize titleLabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:titleLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];

    imageView.frame = self.contentView.bounds;
    titleLabel.frame = CGRectMake(0.0f,0.0f , self.contentView.bounds.size.width, 44.0f);

}
@end
