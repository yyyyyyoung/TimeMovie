//
//  DetailHeadView.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//
#import "DetailHeadView.h"
#import "UIButton+WebCache.h"

// 系统提供的视频播放框架
#import <MediaPlayer/MediaPlayer.h>


@interface DetailHeadView()
{
    NSDictionary *_data;
    
}
@end

@implementation DetailHeadView

- (void)awakeFromNib
{
    
    [self loadData];
    
    NSArray *array = _data[@"images"];
    
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.layer.cornerRadius = 5;
    _scrollView.layer.borderColor = [UIColor purpleColor].CGColor;
    _scrollView.layer.borderWidth = 2;
    
    CGFloat width = _scrollView.height - 10;
    for (int i = 0; i < array.count; i++)
    {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(i * ( width + 5) + 5, 5, width, width)];
        [view sd_setImageWithURL:[NSURL URLWithString:array[i]]];
        [_scrollView addSubview:view];
    }
    _scrollView.contentSize = CGSizeMake(5 + (width + 5) * 6, 0);
    
}


- (void)loadData
{
    _data = [MovieJSON readJSONFile:@"movie_detail"];
    NSURL *url = [NSURL URLWithString:_data[@"image"]];
    [_imageButton sd_setImageWithURL:url forState:UIControlStateNormal];
    _titleLabel.text = _data[@"titleCn"];
    
    NSArray *array = _data[@"directors"];
    _directorsLabel.text = [NSString stringWithFormat:@"导演: %@", [array componentsJoinedByString:@","]];
    array = _data[@"actors"];
    _actorsLabel.text = [NSString stringWithFormat:@"演员: %@", [array componentsJoinedByString:@","]];

    array = _data[@"type"];
    _typeLabel.text = [NSString stringWithFormat:@"类型: %@", [array componentsJoinedByString:@","]];
    
    _yearLabel.text = [NSString stringWithFormat:@"上映年份:%@", _data[@"year"]];
}



- (IBAction)imageButtonAction:(id)sender {
    
    
    //播放视频  @"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"
    MPMoviePlayerViewController *moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vf1.mtime.cn/Video/2012/04/23/mp4/120423212602431929.mp4"]];
    [self.navigationController pushViewController:moviePlayer animated:YES];
    
    
}
@end
