//
//  UIButton+ExpandArea.m
//  KOButton
//
//  Created by uyi on 2017/3/15.
//  Copyright © 2017年 GCHShoppingGuide. All rights reserved.
//

#import "UIButton+ExpandArea.h"
#import <objc/runtime.h>

@implementation UIButton (ExpandArea)
static char topExpandKey;
static char bottomExpandKey;
static char leftExpandKey;
static char rightExpandKey;


static char scaleExpandKey;

- (void)setExpandAreaWithEdge:(UIEdgeInsets )edgeInset
{
    objc_setAssociatedObject(self, &topExpandKey, [NSNumber numberWithFloat:edgeInset.top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightExpandKey, [NSNumber numberWithFloat:edgeInset.right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomExpandKey, [NSNumber numberWithFloat:edgeInset.bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftExpandKey, [NSNumber numberWithFloat:edgeInset.left], OBJC_ASSOCIATION_COPY_NONATOMIC);


}


- (void)setExpandScale:(CGFloat)scale
{
    objc_setAssociatedObject(self, &scaleExpandKey, [NSNumber numberWithFloat:scale], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect) expandRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topExpandKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightExpandKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomExpandKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftExpandKey);

    NSNumber* scaleExpand = objc_getAssociatedObject(self, &scaleExpandKey);



    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else if(scaleExpand)
    {
        CGFloat btnWidth = self.bounds.size.width;
        CGFloat btnHeight = self.bounds.size.height;
        CGFloat expandBtnWidth = btnWidth * scaleExpand.floatValue;
        CGFloat expandBtnHeigt = btnHeight * scaleExpand.floatValue;

        return CGRectMake(self.bounds.origin.x - (expandBtnWidth - btnWidth) * 0.5,
                          self.bounds.origin.y - (expandBtnHeigt - btnHeight) * 0.5,
                          expandBtnWidth,
                          expandBtnHeigt);
    }else{
        return self.bounds;
    }
}

- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self expandRect];
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor greenColor];
    [self.maskView addSubview:view];

    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}


@end
