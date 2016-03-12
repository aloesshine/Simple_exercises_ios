//
//  NewsCell.m
//  news
//
//  Created by aloes on 16/3/12.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"

@implementation NewsCell

+ (NSString *)ID
{
    return @"cell";
}

+ (id)newsCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil][0];
}

- (void)setNews:(News *)news
{
    self.titleLable.text = news.title;
    self.commentsLable.text = news.comments;
    self.sourceLable.text = news.source;
    self.iconView.image = [UIImage imageNamed:news.icon];
}

@end
