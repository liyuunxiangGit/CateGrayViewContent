//
//  CategoryDetailVCViewController.m
//  CategoryViewDemo
//
//  Created by xxt-imac on 16/5/31.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "CategoryDetailVCViewController.h"


//颜色
#define UIColorFromRGB2(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CategoryDetailVCViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CategoryDetailVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, 180)];
    bgView.backgroundColor=UIColorFromRGB2(244, 244, 244);
    [self.view addSubview:bgView];
     self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    
    //确定水平滚动还是垂直滚动
    UICollectionViewFlowLayout  *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(9, 13, [UIScreen mainScreen].bounds.size.width-18, 180-22) collectionViewLayout:flowLayout];
    self.collectionView.dataSource =self;
    self.collectionView.delegate =self;
    [self.collectionView setBackgroundColor:UIColorFromRGB2(244, 244, 244)];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [bgView addSubview:self.collectionView];
    [self.collectionView reloadData];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    id obj = [touches anyObject];
    if (obj != _collectionView) {
        [self.view setHidden:YES];
    }
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //
    NSLog(@"更新collection的内容");
    
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.frame];
    label.backgroundColor=[UIColor whiteColor];
    label.layer.cornerRadius=5;
    label.layer.masksToBounds=YES;
    label.font=[UIFont systemFontOfSize:14];
    label.textColor = UIColorFromRGB2(103, 100, 100);
    //    label.textColor = UIColorFromRGB2(143,195,31);
    
    label.textAlignment=NSTextAlignmentCenter;
    
    label.text = _dataArr[indexPath.row];
    
    
//    NSDictionary * dic =_dataArr[indexPath.row];
//    if (_caty==AddressCaty) {
//        
//        label.text=dic[@"area_name"];
//        
//    }else{
//        label.text=dic[@"category_name"];
//    }
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell.contentView addSubview:label];
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat w=([UIScreen mainScreen].bounds.size.width-4*18)/3;
    return CGSizeMake(w, 40);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(9, 9, 18, 9);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary * dic =_dataArr[indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(CategoryDetailComplete:categoryDetail:)]) {
        [self.delegate CategoryDetailComplete:dic categoryDetail:_caty];
    }
    [self.view setHidden:YES];
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
