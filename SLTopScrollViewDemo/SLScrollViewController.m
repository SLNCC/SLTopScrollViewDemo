//
//  SLScrollViewController.m
//  XinhuaVideo
//
//  Created by 乔冬 on 16/9/28.
//  Copyright © 2016年 com.xinhuashixun. All rights reserved.
//

#import "SLScrollViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define ContentCellSepLine  [UIColor colorWithRed:216/256.0 green:216/256.0 blue:216/256.0 alpha:1.0]
#define titleWidth SCREEN_WIDTH/_titleArray.count
#define titleHeight 40
#define DefaultTitleNomalColor [UIColor blackColor]
#define DefaultTitleSelectedColor [UIColor colorWithRed:84 / 255.0 green:154 / 255.0 blue:234 / 255.0 alpha:1.0]
#define DefaultLineColor [UIColor colorWithRed:84 / 255.0 green:154 / 255.0 blue:234 / 255.0 alpha:1.0]
#define DefaultTitleFont 14
#define  SliderH 3.5
@interface SLScrollViewController ()<UIScrollViewDelegate> {
    
    UIButton *selectButton;
    UIImageView *_sliderView;
    UIViewController *_viewController;
    UIScrollView *_scrollView;
    UIImageView * _borderImgView;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;
@end

@implementation SLScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _buttonArray = [NSMutableArray array];
    
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    [self initWithTitleButton];
}

- (void)setControllerArray:(NSArray *)controllerArray {
    _controllerArray = controllerArray;
    [self initWithController];
}

- (void)initWithTitleButton
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, titleHeight)];
    titleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:titleView];
    if (self.navigationController.navigationBar) {
        titleView.frame = CGRectMake(0, 64, SCREEN_WIDTH, titleHeight -64);
    } else {
        titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, titleHeight);
    }
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    for (int i = 0; i < _titleArray.count; i++) {
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(titleWidth*i, 0, titleWidth, titleHeight);
        [titleButton setTitle:_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:DefaultTitleNomalColor forState:UIControlStateNormal];
        [titleButton.titleLabel setFont:[UIFont systemFontOfSize:DefaultTitleFont]];
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleButton];
        if (i == 0) {
            selectButton = titleButton;
            [selectButton setTitleColor:DefaultTitleSelectedColor forState:UIControlStateNormal];
        }
        [_buttonArray addObject:titleButton];
        
    }
    
    //滑块
    UIImageView *sliderV=[[UIImageView alloc]initWithFrame:CGRectMake(0, titleHeight-SliderH, titleWidth, SliderH)];
    sliderV.image = [UIImage imageNamed:@"slider"];
    //    sliderV.backgroundColor = [UIColor redColor];
    [titleView addSubview:sliderV];
    _sliderView=sliderV;
    
    
    UIImageView *borderImgView = [[UIImageView alloc]init];
    borderImgView.backgroundColor = ContentCellSepLine;
    borderImgView.frame = CGRectMake(0, titleHeight - 0.5, SCREEN_WIDTH, 0.5);
    [titleView addSubview:borderImgView];
    _borderImgView = borderImgView;
 
    
}

- (void)scrollViewSelectToIndex:(UIButton *)button
{
    
    [self selectButton:button.tag-100];
    [UIView animateWithDuration:0 animations:^{
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH*(button.tag-100), 0);
    }];
}

//选择某个标题
- (void)selectButton:(NSInteger)index
{
    [selectButton setTitleColor:DefaultTitleNomalColor forState:UIControlStateNormal];
    selectButton = _buttonArray[index];
    [selectButton setTitleColor:DefaultTitleSelectedColor forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        _sliderView.frame = CGRectMake(titleWidth*index, titleHeight-SliderH, titleWidth, SliderH);
    }];
    
}

//监听滚动事件判断当前拖动到哪一个了
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    [self selectButton:index];
    
}

- (void)initWithController
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self.navigationController.navigationBar) {
        scrollView.frame = CGRectMake(0, titleHeight, SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight);
    } else {
        scrollView.frame = CGRectMake(0, titleHeight, SCREEN_WIDTH, SCREEN_HEIGHT-titleHeight);
    }
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor colorWithWhite:0.900 alpha:1.000];
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_controllerArray.count, 0);
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    for (int i = 0; i < _controllerArray.count; i++) {
        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        UIViewController *viewcontroller = _controllerArray[i];
        viewcon = viewcontroller.view;
        viewcon.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        [scrollView addSubview:viewcon];
        
    }
    
}


@end
