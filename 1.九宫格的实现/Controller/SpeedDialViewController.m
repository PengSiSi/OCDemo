//
//  SpeedDialViewController.m
//  OCDemo
//
//  Created by 思 彭 on 16/11/18.
//  Copyright © 2016年 思 彭. All rights reserved.
//

#import "SpeedDialViewController.h"
#import "PSView.h"

@interface SpeedDialViewController ()

@end

@implementation SpeedDialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PSView *psView = [[PSView alloc]initWithFrame:CGRectMake((K_SCREEN_WIDTH - 300) / 2, 100, 300, 300)];
    psView.backgroundColor = [UIColor redColor];
    [self.view addSubview:psView];
}

@end
