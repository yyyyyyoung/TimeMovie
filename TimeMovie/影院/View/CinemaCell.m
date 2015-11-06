//
//  CinemaCell.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setCinema:(Cinema *)cinema
{
    _cinema = cinema;
    _nameLabel.text = _cinema.name;
    _addressLabel.text = _cinema.address;
    _ratingLabel.text = _cinema.grade;
    if (_cinema.lowPrice.length == 0)
    {
        _lowPrice.text = @"暂无报价";
    }
    else
    {
        _lowPrice.text = [NSString stringWithFormat:@"¥%@", _cinema.lowPrice];
    }
    
    _type1.hidden = [_cinema.isCouponSupport isEqualToString:@"0"];
    _type2.hidden = [_cinema.isGroupBuySupport isEqualToString:@"0"];
    _type3.hidden = [_cinema.isSeatSupport isEqualToString:@"0"];
    
    _imax.hidden = [_cinema.isImaxSupport isEqualToString:@"0"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
