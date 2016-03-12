//
//  NewsCell.h
//  news
//
//  Created by aloes on 16/3/12.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;

@interface NewsCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *iconView;
@property (nonatomic, weak) IBOutlet UILabel *titleLable;
@property (nonatomic, weak) IBOutlet UILabel *sourceLable;
@property (nonatomic, weak) IBOutlet UILabel *commentsLable;
@property (nonatomic, strong) News *news;

+ (NSString *)ID;
+ (id)newsCell;
- (void)setNews:(News *)news;

@end
