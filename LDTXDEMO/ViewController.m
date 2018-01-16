//
//  ViewController.m
//  LDTXDEMO
//
//  Created by ios on 2018/1/16.
//  Copyright © 2018年 LuoDong. All rights reserved.
//  gitHub:
//

#import "ViewController.h"
#import "HomeHeaderView.h"
@interface ViewController ()

@property(nonatomic,strong)HomeHeaderView *headView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.headView];
    
}

-(HomeHeaderView *)headView{
    
    /*
     试了很多次，6张图片效果最佳，所以 目前项目只支持6张图片。请看清楚再添加图片。支持网络图片和本地图片。
     */
    if (!_headView) {
        
        _headView = [[HomeHeaderView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 250)];
        _headView.imgArray = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg"];
    }
    
    return _headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
