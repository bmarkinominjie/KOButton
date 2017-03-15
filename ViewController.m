//
//  ViewController.m
//  KOButton
//
//  Created by uyi on 2017/3/15.
//  Copyright © 2017年 GCHShoppingGuide. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ExpandArea.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//方法一：直接用runtime修改UIbutton的事件区域
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setExpandScale:2];
    btn.frame = CGRectMake(100, 100, 80, 80);
    [btn setExpandAreaWithEdge:UIEdgeInsetsMake(40, 40, 40, 40)];
    btn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick
{
    NSLog(@"++++++++++++++++++++++++++++++");
}

//方法二：继承UIButton,重写他的方法
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
//{
//    CGRect bounds = self.bounds;
//    bounds = CGRectInset(bounds, -0.5 * 20, -0.5 * 20);
//    return CGRectContainsPoint(bounds, point);
//}

@end
