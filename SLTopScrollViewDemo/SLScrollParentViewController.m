//
//  SLScrollParentViewController.m
//  SLTopScrollViewDemo
//
//  Created by 乔冬 on 16/10/12.
//  Copyright © 2016年 XinHuaTV. All rights reserved.
//

#import "SLScrollParentViewController.h"

@interface SLScrollParentViewController ()
@property (nonatomic,strong)   UIViewController *firstVC;
@property (nonatomic,strong)   UIViewController *secVC;
@property (nonatomic,strong)   UIViewController *thirdVC;
@end

@implementation SLScrollParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"记录者";
    [self childVCS];
}


- (void)childVCS{
    
    _firstVC = [[UIViewController alloc]init];
    _secVC = [[UIViewController alloc]init];
    _thirdVC = [[UIViewController alloc]init];
    
    self.titleArray = @[@"推荐",@"分类",@"直播"];
    //控制器的总个数
    self.controllerArray =@[_firstVC,_secVC,_thirdVC];
}



@end
