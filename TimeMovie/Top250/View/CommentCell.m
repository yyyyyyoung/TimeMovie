//
//  CommentCell.m
//  TimeMovie
//
//  Created by mac on 15/8/24.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
    _bgView.layer.cornerRadius = 3;
    _bgView.layer.borderColor = [UIColor redColor].CGColor;
    _bgView.layer.borderWidth = 2;
    _bgView.layer.masksToBounds = YES;
    
}


- (void)setComment:(Comment *)comment
{
    _comment = comment;
    _commentLabel.text = _comment.content;
    _name.text = _comment.nickname;
    _rating.text = _comment.rating;
    [_i sd_setImageWithURL:[NSURL URLWithString:_comment.userImage]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
