//
//  HMCategoryView.m
//  CategoryViewDemo
//
//  Created by 李云祥 on 16/5/31.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import "HMCategoryView.h"
@implementation CategoryBtn


-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        _titltLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_titltLabel];
        _titltLabel.text = title;
        _titltLabel.textColor = [UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1];
        _titltLabel.textAlignment=NSTextAlignmentCenter;
        _titltLabel.font=[UIFont systemFontOfSize:14];
        
        
        _line=[[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width-1, 14, 1, 14)];
        _line.backgroundColor=[UIColor colorWithRed:137/255.0 green:137/255.0 blue:88/255.0 alpha:1];;
        [self addSubview:_line];
        
        _triangle=[[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width-25, self.bounds.size.height-25, 8, 8)];
        
        _triangle.image=[UIImage imageNamed:@"三角-灰"];
        [self addSubview:_triangle];

        
    }
    return self;
}

@end



@implementation HMCategoryView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatCategory:@[@"全部地区",@"全部分类",@"往期活动"]];
    }
    return self;
}

-(void)creatCategory:(NSArray *)data
{
    CGSize M_size = [UIScreen mainScreen].bounds.size;
    for (int i =0; i<data.count; i++) {
        CategoryBtn *btn = [[CategoryBtn alloc]initWithFrame:CGRectMake(i*M_size.width/data.count, 0, M_size.width/data.count-2, self.bounds.size.height) title:data[i]];
        
        if (i==data.count-1) {
            btn.line.hidden = YES;
            btn.triangle.hidden = YES;
        }
        [self addSubview:btn];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)btnClick:(CategoryBtn *)sender
{
    for (id  caty in self.subviews) {
        if ([caty isKindOfClass:[CategoryBtn class]]) {
            CategoryBtn * btnGory=caty;
            if (sender==caty) {
                //                sender.titleLable.textColor=UIColorFromRGB2(32, 208, 169);
                sender.titltLabel.textColor=[UIColor colorWithRed:143/255.0 green:195/255.0 blue:31/255.0 alpha:1];
                [sender.triangle setImage:[UIImage imageNamed:@"三角-绿"]];
            }else{
                btnGory.titltLabel.textColor=[UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1];                [btnGory.triangle setImage:[UIImage imageNamed:@"三角-灰"]];
                
            }
        }
    }
    if (self.delegate&&[self.delegate respondsToSelector:@selector(CategoryView:index:)]) {
        [self.delegate CategoryView:self index:sender.tag ];
    }

}
@end
