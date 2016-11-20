//
//  ViewController.m
//  OCDemo
//
//  Created by 思 彭 on 16/11/18.
//  Copyright © 2016年 思 彭. All rights reserved.
//

#import "ViewController.h"
#import "SpeedDialViewController.h"

#define k_ScreenWidth [UIScreen mainScreen].bounds.size.width;
#define k_ScreenHeight [UIScreen mainScreen].bounds.size.height;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"OC Demo实现";
    [self initData];
    [self setUI];
}


#pragma mark - initData

- (void)initData {
    
    self.dataArray = @[@"1:九宫格的实现"];
}

#pragma mark - 设置界面

- (void)setUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        SpeedDialViewController *speedDialVc = [[SpeedDialViewController alloc]init];
        [self.navigationController pushViewController:speedDialVc animated:YES];
    }
}

#pragma mark - Private Method

#pragma mark - 懒加载

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        // 注册cell
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}


@end
