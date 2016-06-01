//
//  CategoryDetailVCViewController.h
//  CategoryViewDemo
//
//  Created by xxt-imac on 16/5/31.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum :NSInteger
{
    AddressCaty,
    ActivityCaty,
}CategoryDetail;


@protocol CategoryDetailVCDelegate <NSObject>

-(void)CategoryDetailComplete:(NSDictionary*)dic categoryDetail:(CategoryDetail)caty;

@end

@interface CategoryDetailVCViewController : UIViewController
@property(nonatomic,weak)id<CategoryDetailVCDelegate>delegate;

@property (nonatomic,assign)CategoryDetail caty;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) UICollectionView *collectionView;

@end
