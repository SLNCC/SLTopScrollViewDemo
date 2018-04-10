//
//  SLTopTitleView.h
//  SLTopScrollViewDemo
//
//  Created by 乔冬 on 16/10/12.
//  Copyright © 2016年 XinHuaTV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLTopTitleView;

@protocol SLTopTitleViewDelegate <NSObject>
// delegate 方法
- (void)SLTopTitleView:(SLTopTitleView *)topTitleView didSelectTitleAtIndex:(NSInteger)index;

@end

@interface SLTopTitleView : UIScrollView
/** 静止标题数组 */
@property (nonatomic, strong) NSArray *staticTitleArr;
/** 滚动标题数组 */
@property (nonatomic, strong) NSArray *scrollTitleArr;
/** 存入所有Label */
@property (nonatomic, strong) NSMutableArray *allTitleLabel;
@property (nonatomic, weak) id<SLTopTitleViewDelegate> delegate_SL;

/** 类方法 */
+ (instancetype)topTitleViewWithFrame:(CGRect)frame;


#pragma mark - - - 给外界ScrollView提供的方法以及自身方法实现
/** 静止标题选中颜色改变以及指示器位置变化 */
- (void)staticTitleLabelSelecteded:(UILabel *)label;
/** 滚动标题选中颜色改变以及指示器位置变化 */
- (void)scrollTitleLabelSelecteded:(UILabel *)label;
/** 滚动标题选中居中 */
- (void)scrollTitleLabelSelectededCenter:(UILabel *)centerLabel;

#pragma mark - - - 给外界ScrollView提供的方法
/** 滚动ScrollView, 让文字呈现渐显效果, 给外界ScrollView的scrollViewDidScroll方法提供的方法*/
- (void)scrollTitleLabelChangeTextColorFadeScrollView:(UIScrollView *)scrollView;
@end
