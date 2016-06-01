//
//  HMCategoryView.h
//  CategoryViewDemo
//
//  Created by xxt-imac on 16/5/31.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMCategoryView;

@protocol HMCategoryViewDelegate <NSObject>

-(void)CategoryView:(HMCategoryView *)Category index:(NSInteger)index;

@end



@interface HMCategoryView : UIView

@property(nonatomic,weak)id<HMCategoryViewDelegate>delegate;

-(void)creatCategory:(NSArray *)data;

@end


@interface CategoryBtn : UIControl

@property (nonatomic,strong)UILabel *titltLabel;
@property (nonatomic,strong)UIView *line;
@property (nonatomic,strong)UIImageView *triangle;

@end