//
//  CollectionLayout.m
//  CollectionViewLayout
//
//  Created by aloes on 2017/4/27.
//  Copyright © 2017年 aloes. All rights reserved.
//

#import "CollectionLayout.h"

@interface CollectionLayout ()


@end

@implementation CollectionLayout
{
    NSMutableArray<UICollectionViewLayoutAttributes *> *_attributeArray;
}

// 设置布局配置数据
- (void)prepareLayout {
    
    [super prepareLayout];
    
    _attributeArray = [NSMutableArray array];
    
    CGFloat WIDTH = ([UIScreen mainScreen].bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing) / 2.0;
    CGFloat colH[2] = {self.sectionInset.top, self.sectionInset.top};
    
    for(int i = 0;i < _itemCount; i ++) {
        
        // 根据indexPath取出当前item的att
        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        CGFloat x = 0, y = 0, h = arc4random() % 150 + 50;
        if (colH[0] <= colH[1]) { // 放左边
            x = self.sectionInset.left;
            y = colH[0] + self.minimumLineSpacing;
            colH[0] += self.minimumLineSpacing + h;
        } else { // 放右边
            x = self.sectionInset.left + self.minimumInteritemSpacing + WIDTH;
            y = colH[1] + self.minimumLineSpacing;
            colH[1] += self.minimumLineSpacing + h;
        }
        att.frame = CGRectMake(x, y, WIDTH, h);
        
        [_attributeArray addObject:att];
    }
}

// 返回配置数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _attributeArray;
}
@end
