//
//  CinemaCell.h
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cinema.h"

@interface CinemaCell : UITableViewCell

@property (nonatomic, strong) Cinema *cinema;


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowPrice;
@property (weak, nonatomic) IBOutlet UIImageView *type1;
@property (weak, nonatomic) IBOutlet UIImageView *type2;
@property (weak, nonatomic) IBOutlet UIImageView *type3;
@property (weak, nonatomic) IBOutlet UIImageView *imax;

@end
