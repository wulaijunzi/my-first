//
//  ViewController.m
//  刷新
//
//  Created by 汪洋 on 15/11/17.
//  Copyright © 2015年 刘文辽. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "huatipinglunModelBaseClass.h"
#import "huatipinglunModelRes.h"
#import "DownLoadManager.h"
#import "HYCircleLoadingView.h"
#import "SRRefreshView.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,SRRefreshDelegate>
{
    NSInteger pagenumber;
    SRRefreshView   *_slimeView;

}
@property (nonatomic,strong)UITableView *mytableview;
@property (nonatomic,strong)UILabel *footerLabel;
@property (nonatomic,strong)NSMutableArray *statuses;
@property (nonatomic,strong)NSMutableArray *listArray;
@property (nonatomic,strong)HYCircleLoadingView *HYloading;
@end

@implementation ViewController

- (HYCircleLoadingView*)HYloading
{
    if (!_HYloading) {
        _HYloading = [[HYCircleLoadingView alloc]initWithFrame:CGRectMake(30, 10, 30, 30)];;
    }
    return _HYloading;
}
- (NSMutableArray *)listArray
{
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _listArray;
}
- (NSMutableArray*)statuses
{
    if (!_statuses) {
        _statuses = [NSMutableArray arrayWithCapacity:0];
    }
    return _statuses;
}
- (UITableView*)mytableview
{
    if (!_mytableview) {
        _mytableview = [[UITableView alloc]init];
    }
    return _mytableview;
}
- (UILabel *)footerLabel
{
    if (!_footerLabel) {
        _footerLabel = [[UILabel alloc]init];
    }
    return _footerLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  clearColor];
    self.title = @"保险堂";
    self.navigationController.navigationBar.translucent = NO;
    self.mytableview.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-64);
    self.mytableview.delegate = self;
    self.mytableview.dataSource = self;
    self.mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mytableview];
    
    _slimeView = [[SRRefreshView alloc] init];
    _slimeView.backgroundColor = [UIColor whiteColor];
    _slimeView.delegate = self;
    _slimeView.upInset = 0;
    _slimeView.slimeMissWhenGoingBack = YES;
    _slimeView.slime.bodyColor = [UIColor grayColor];
    _slimeView.slime.skinColor = [UIColor clearColor];
    _slimeView.slime.lineWith = 1;
    _slimeView.slime.shadowBlur = 1;
    _slimeView.slime.shadowColor = [UIColor clearColor];
    [self.mytableview addSubview:_slimeView];

    
    
    self.footerLabel.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 50);
    self.footerLabel.textColor = [UIColor blackColor];
    self.footerLabel.text = @"正在加载数据";

    self.footerLabel.font = [UIFont systemFontOfSize:16];
    self.footerLabel.backgroundColor = [UIColor cyanColor];
    self.footerLabel.textAlignment = NSTextAlignmentCenter;
    
//    [_slimeView setLoadingWithexpansion];
}
- (void)refreshStateChange
{
    
    [DownLoadManager requestWithUrl:[NSString stringWithFormat:@"http://m.datebaoxian.com/api2/util/topicCommontList"] dict:@{@"page":@"0",@"tid":@"4",} delegate:self finishedSEL:@selector(downfinish:) isPost:NO failedSEL:@selector(downfailed)];
}
- (void)downfinish:(id)responsobject
{

    huatipinglunModelBaseClass *baseclass = [[huatipinglunModelBaseClass alloc]initWithDictionary:responsobject];
    if ([[responsobject objectForKey:@"code"] integerValue] == 0) {
        
        pagenumber += 1;
        for (int i = 0; i<baseclass.res.count; i++) {
            huatipinglunModelRes *res = [baseclass.res objectAtIndex:i];
            [self.listArray addObject:res];
        }
        [self performSelector:@selector(shuxintable) withObject:nil afterDelay:1];

        
    }
}
- (void)shuxintable
{
    
    [_slimeView endRefresh];

    [self.mytableview reloadData];

    self.mytableview.tableFooterView = self.footerLabel;
    self.mytableview.tableFooterView.hidden = YES;


}
#pragma  mark - 上拉刷新
- (void)loadMoreStatus:(NSString *)page
{
    
    
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:@"http://m.datebaoxian.com/api2/util/topicCommontList" parameters:@{@"page":page,@"tid":@"4",} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        huatipinglunModelBaseClass *baseclass = [[huatipinglunModelBaseClass alloc]initWithDictionary:responseObject];
        if ([[responseObject objectForKey:@"code"] integerValue] == 0) {
            pagenumber += 1;
            for (int i = 0; i<baseclass.res.count; i++) {
                huatipinglunModelRes *res = [baseclass.res objectAtIndex:i];
                [self.listArray addObject:res];
            }
        
            [self.HYloading stopAnimation];
        
        [self.mytableview reloadData];

        self.mytableview.tableFooterView.hidden = YES;
        }
            
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self performSelector:@selector(statopen) withObject:nil afterDelay:3];
    }];
}
-(void)statopen
{
    self.mytableview.tableFooterView.hidden = YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    [_slimeView scrollViewDidScroll];

    if (self.mytableview.tableFooterView.isHidden == NO)
    return;
    CGFloat offsetY = scrollView.contentOffset.y;
    //当最后一个cell完全显示在眼前时，contentOffset 的y值
    CGFloat judgeOffsetY = scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.frame.size.height - self.mytableview.tableFooterView.frame.size.height;
    if (offsetY >= judgeOffsetY) {

        [self.footerLabel addSubview:self.HYloading];

        self.mytableview.tableFooterView.hidden = NO;
        self.footerLabel.hidden = NO;
        [self.HYloading startAnimation];
        [self performSelector:@selector(qwqwqwqw) withObject:nil afterDelay:2];
       
    }
}
- (void)qwqwqwqw
{
     [self loadMoreStatus:[NSString stringWithFormat:@"%ld",(long)pagenumber]];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cajsich";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    huatipinglunModelRes *res = [self.listArray objectAtIndex:indexPath.row];
    NSString *content = res.content;

    cell.textLabel.text = content;
    cell.backgroundColor = [UIColor brownColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - scrollView delegate


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [_slimeView scrollViewDidScroll];
//}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_slimeView scrollViewDidEndDraging];
}

#pragma mark - slimeRefresh delegate

- (void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
{
    [self.listArray removeAllObjects];
    [self performSelector:@selector(refreshStateChange) withObject:nil];
//    [self performSelector:@selector(refreshStateChange)
//                     withObject:nil afterDelay:1
//                        inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
}

@end
