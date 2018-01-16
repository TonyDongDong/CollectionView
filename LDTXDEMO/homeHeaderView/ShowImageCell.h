//
//  ShowImageCell.h
//  UICollectionViewDemo
//
//  Created by 卢鹏肖 on 16/1/7.
//  Copyright © 2016年 com.shuai. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ShowImageCell : UICollectionViewCell
{
    UIImageView *imageView ;
    UILabel *titleLabel;
}
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@end
