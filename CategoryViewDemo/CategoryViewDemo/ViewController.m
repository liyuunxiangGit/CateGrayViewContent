//
//  ViewController.m
//  CategoryViewDemo
//
//  Created by xxt-imac on 16/5/31.
//  Copyright © 2016年 xxt-imac. All rights reserved.
//

#import "ViewController.h"
#import "HMCategoryView.h"
#import "CategoryDetailVCViewController.h"
@interface ViewController ()<HMCategoryViewDelegate,CategoryDetailVCDelegate>
@property (strong, nonatomic) IBOutlet UIView *catgoryView;
/**
 *  这个数据应该是网络上请求下来的赋值给它，这里为了模拟，直接给赋值
 */
@property (nonatomic,strong) NSMutableArray *AddressitemList;
@property (nonatomic,strong) NSMutableArray *ActivityitemList;
@property(nonatomic,strong)CategoryDetailVCViewController * detail;
@end

@implementation ViewController
{
    HMCategoryView *cate;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _AddressitemList = [NSMutableArray arrayWithObjects:@"呼和浩特",@"呼伦贝尔",@"背景",@"成都",@"上海",@"山西"@"刘海",@"素手",@"留着",@"呼和浩特",@"呼伦贝尔",@"背景",@"成都",@"上海",@"山西"@"刘海",@"素手",@"留着"@"呼和浩特",@"呼伦贝尔",@"背景",@"成都",@"上海",@"山西"@"刘海",@"素手",@"留着", nil];
    _ActivityitemList = [NSMutableArray arrayWithObjects:@"邹秋",@"篮球偶偶",@"yumaoqiu ",@"木偶",@"打豆豆",@"踢毽子",@"篮球",@"排球",@"运",@"打地鼠",@"健身",@"娃娃", nil];
    
    
    
    cate = [[HMCategoryView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    cate.delegate = self;
    [_catgoryView addSubview:cate];
    
    _emptyView=[[UIView alloc]initWithFrame:CGRectMake(0, 108, self.view.bounds.size.width, self.view.bounds.size.height-108)];
    UIImageView * emptyimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 200)];
    [emptyimage setImage:[UIImage imageNamed:@"暂时没有活动"]];
    [_emptyView addSubview:emptyimage];
    _emptyView.hidden=YES;
    emptyimage.center=CGPointMake(_emptyView.center.x, _emptyView.center.y-108);
    
    [self.view addSubview:_emptyView];

}
#pragma mark -CategoryDetailVCViewControllerDelegate
-(void)CategoryDetailComplete:(NSDictionary *)dic categoryDetail:(CategoryDetail)caty
{
    self.emptyView.hidden=YES;
    [self.view sendSubviewToBack:self.emptyView];
    [_mainTableView reloadData];
//    if (caty==AddressCaty) {
//        CategoryBtn * btn=cate.btnArr[0];
//        [btn.titleLable setText:dic[@"area_name"]];
//        if ([dic[@"area_code"] isEqualToString:@"000"]) {
//            [self.params setValue:@"" forKey:@"areaCode"];
//        }else{
//            [self.params setValue:dic[@"area_code"] forKey:@"areaCode"];
//        }
//        
//    }else{
//        CategoryBtn * btn=cate.btnArr[1];
//        [btn.titleLable setText:dic[@"category_name"]];
//        if ([dic[@"id"] integerValue]==0){
//            [self.params setValue:@"" forKey:@"categoryId"];
//        }else{
//            [self.params setValue:dic[@"id"] forKey:@"categoryId"];
//        }
//    }
//    
//    _showtype=MainListShow;
//    
//    WEAKSELF;
//    [_func getMainPageListWithDirection:1 params:_params  Result:^(BOOL result, NSArray *resultList, NSString *info) {
//        if (result == YES) {
//            if (result == YES) {
//                if ([info isEqualToString:@"first"]) {
//                    [weakSelf.itemList removeAllObjects];
//                }
//            }
//            [weakSelf.itemList addObjectsFromArray:resultList];
//            [weakSelf flushData];
//            if (resultList.count>0) {
//                weakSelf.emptyView.hidden=YES;
//                [weakSelf.view sendSubviewToBack:weakSelf.emptyView];
//                
//            }else{
//                
//                [weakSelf.view bringSubviewToFront:weakSelf.emptyView];
//                weakSelf.emptyView.hidden=NO;
//            }
//            
//        }
//    }];
    
    
}

#pragma mark -HMCategoryView
-(void)CategoryView:(HMCategoryView *)Category index:(NSInteger)index
{
   
    if (_detail==nil) {
        _detail=[[CategoryDetailVCViewController alloc]init];
        [_detail.view setFrame:CGRectMake(0, 108, self.view.bounds.size.width,[UIScreen mainScreen].bounds.size.height-108)];
        [self addChildViewController:_detail];
        [self.view addSubview:_detail.view];
        _detail.delegate=self;
        
    }
    [self.view bringSubviewToFront:_detail.view];
    
    if (index==0) {
        _detail.view.hidden=NO;
        if (_AddressitemList.count>0) {
            _detail.dataArr=_AddressitemList;
            _detail.caty=AddressCaty;
            [_detail.collectionView reloadData];
        }else{
//            [baseSection.net POST:URL_QXAddressCatyPage parameters:nil SectionObject:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSError * error;
//                NSDictionary * respose=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
//                if ([respose[@"resultCode"]integerValue]==1) {
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        NSDictionary * address=@{@"area_code":@"000",
//                                                 @"area_name":@"全部地区",
//                                                 @"province":@"1",
//                                                 };
//                        weakSelf.detail.dataArr=respose[@"areaList"];
//                        if (weakSelf.detail.dataArr.count>0) {
//                            [weakSelf.detail.dataArr insertObject:address atIndex:0];
//                        }
//                        weakSelf.detail.caty=AddressCaty;
//                        [weakSelf.detail.collectionView reloadData];
//                        weakSelf.AddressitemList.array=weakSelf.detail.dataArr;
//                    });
//                }
//                
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                
//            }];
        }
    }else if(index==1){
        self.detail.view.hidden=NO;
        if (self.ActivityitemList.count>0) {
            self.detail.dataArr=self.ActivityitemList;
            self.detail.caty=ActivityCaty;
            [self.detail.collectionView reloadData];
        }else{
//            [baseSection.net POST:URL_QXActivityCatyPage parameters:nil SectionObject:self success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSError * error;
//                NSDictionary * respose=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
//                if ([respose[@"resultCode"]integerValue]==1) {
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        
//                        NSDictionary * catelist=@{
//                                                  @"id":@"0",
//                                                  @"category_name":@"全部活动",
//                                                  @"seq":@"0",
//                                                  };
//                        weakSelf.detail.dataArr=respose[@"dataList"];
//                        if (weakSelf.detail.dataArr.count>0) {
//                            [weakSelf.detail.dataArr insertObject:catelist atIndex:0];
//                        }
//                        weakSelf.detail.caty=ActivityCaty;
//                        [weakSelf.detail.collectionView reloadData];
//                        weakSelf.ActivityitemList.array=weakSelf.detail.dataArr;
//                    });
//                }
//                
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                
//            }];
        }
        
        
    }else{
        [_emptyView setHidden:NO];
        _detail.view.hidden=YES;
        [self.view bringSubviewToFront:self.emptyView];
        //这句是重点
//        weakSelf.emptyView.hidden=YES;
//        [weakSelf.view sendSubviewToBack:weakSelf.emptyView];
        
        
//        _showtype=HistoryShow;
//        _itemList = [[NSMutableArray alloc]init];
//        if (_func == nil) {
//            _func = [[InterestPlayFunction alloc]init];
//        }
//        
        [self setExtraCellLineHidden:_mainTableView];
//        WEAKSELF;
//        [_func getHistoryPageListWithDirection:1 Result:^(BOOL result, NSArray *resultList, NSString *errMsg) {
//            if ([errMsg isEqualToString:@"first"]) {
//                [weakSelf.itemList removeAllObjects];
//            }
//            if (resultList.count>0) {
//                weakSelf.emptyView.hidden=YES;
//                [weakSelf.view sendSubviewToBack:weakSelf.emptyView];
//                
//            }else{
//                weakSelf.emptyView.hidden=NO;
//                [weakSelf.view bringSubviewToFront:weakSelf.emptyView];
//                
//            }
//            [weakSelf.itemList addObjectsFromArray:resultList];
//            //这是刷新tableview
//            [weakSelf flushData];
//            
//        }];
        
        
    }

}
- (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
