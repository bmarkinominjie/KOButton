//
//  UIButton+ExpandArea.h
//  KOButton
//
//  Created by uyi on 2017/3/15.
//  Copyright © 2017年 GCHShoppingGuide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ExpandArea)

//拓展的边界
- (void)setExpandAreaWithEdge:(UIEdgeInsets )edgeInset;

//放缩比例大于 1.0
- (void)setExpandScale:(CGFloat)scale;

@end
