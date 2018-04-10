//
//  SLNavigationItemTitleView.m
//  SLTopScrollViewDemo
//
//  Created by 乔冬 on 16/10/12.
//  Copyright © 2016年 XinHuaTV. All rights reserved.
//

#import "SLNavigationItemTitleView.h"

@implementation SLNavigationItemTitleView
- (void)setFrame:(CGRect)frame {
    [super setFrame:CGRectMake(80, 0, self.superview.bounds.size.width - 80, self.superview.bounds.size.height)];
}



@end
