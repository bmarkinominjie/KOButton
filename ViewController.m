//
//  ViewController.m
//  KOButton
//
//  Created by uyi on 2017/3/15.
//  Copyright © 2017年 GCHShoppingGuide. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ExpandArea.h"
//#import "UIButton+EnlargeTouchArea.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

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


@end
