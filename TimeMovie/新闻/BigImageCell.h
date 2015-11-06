//
//  BigImageCell.h
//  TimerMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageCell : UICollectionViewCell

@property (nonatomic, strong) NSURL *imageURL;  // 单元格中的imaageView 显示的图片


/**
 *  还原图片的缩放比例
 */
- (void)backImageZoomingScale;

@end
