//
//  PopButton.m
//  practice_hittext
//
//  Created by aloes on 16/6/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "PopButton.h"

@implementation PopButton

// 寻找最合适的View
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint p = [self convertPoint:point toView:self.chatBtn];
    if ([self.chatBtn pointInside:p withEvent:event])
    {
        return self.chatBtn;
    }
    
    return [super hitTest:point withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint nowP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    
    self.transform = CGAffineTransformTranslate(self.transform, nowP.x - preP.x, nowP.y - preP.y);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
