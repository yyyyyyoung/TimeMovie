//
//  CinemaViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CinemaViewController.h"
#import "District.h"
#import "Cinema.h"
#import "CinemaCell.h"


@interface CinemaViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_districtData;
    
    UITableView *_tableView;
}
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"影院";
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 读取数据
    [self loadData];
    

    [self _createTableView];
}


- (void)_createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = [UIColor blackColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    District *dis = _districtData[section];
    
    if (dis.isShow)
    {
        return dis.cinemas.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cinema"];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CinemaCell" owner:nil options:nil]lastObject];
    }
    
    // 城区
    District *dis = _districtData[indexPath.section];
    // 影院
    Cinema *cinema = dis.cinemas[indexPath.row];
    
    cell.cinema = cinema;
    
    return cell;
    
}

// 设定分组的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  _districtData.count;
}


// 单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - 单元格组头视图
// 设定高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

// 头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kScreenWidth, 35);
    // 获取地区对象
    District *dis = _districtData[section];
    // 将这个地区的名字设置为按钮的title
    [button setTitle:dis.name forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage@2x"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = section;
    
    return button;
}


#pragma mark - action
- (void)buttonAction:(UIButton *)button
{
    // 通过tag 来判断点击的是那个组的头视图
    NSInteger section = button.tag;
    // 切换隐藏/显示
    District *dis = _districtData[section];
    dis.isShow = !dis.isShow;
    // 刷新表视图
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:section];
    [_tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}


- (void)loadData
{
    // 读取地区数据
    NSDictionary *dic1 = [MovieJSON readJSONFile:@"district_list"];
    NSArray *array1 = dic1[@"districtList"]; // 储存地区数据的数组
    _districtData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array1)
    {
        District *disrtict = [[District alloc] initContentWithDic:dic];
        [_districtData addObject:disrtict];
    }
    
    
    
    // 读取电影院数据
    NSDictionary *dic2 = [MovieJSON readJSONFile:@"cinema_list"];
    NSArray *array2 = dic2[@"cinemaList"];
    for (NSDictionary *dic in array2)
    {
        Cinema *cinema = [[Cinema alloc]initContentWithDic:dic];
        
        for (District *dis in _districtData)
        {
            // 比较电影院的地区id 和 地区是否匹配
            if ([dis.districtID isEqualToString:cinema.districtId])
            {
                // 如果匹配  就说明这家电影院在这个地区中
                [dis.cinemas addObject:cinema];
                
                break;
            }
        }
    }
    
    
    
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
