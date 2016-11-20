//
//  PSView.m
//  OCDemo
//
//  Created by 思 彭 on 16/11/18.
//  Copyright © 2016年 思 彭. All rights reserved.
//

#import "PSView.h"

@interface PSView ()

@property (nonatomic, strong) NSMutableArray *buttonMutableArray;

@end

@implementation PSView

#pragma mark - 设置界面

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _createSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

// 创建九个按钮

- (void)_createSubViews {
    
    for (NSInteger i = 0; i < 9; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor greenColor];
        [self addSubview:btn];
        // 禁止按钮的点击事件
        btn.userInteractionEnabled = NO;
    }
}

- (void)layoutSubviews {
    
    // 一定要先调用父类方法
    [super layoutSubviews];
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        //取出按钮
        UIButton *button = self.subviews[i];
        // 九宫格计算每个按钮的frame
        CGFloat row = i / 3;
        CGFloat col = i % 3;
        CGFloat btnWidth = 74;
        CGFloat btnHeight = 74;
        CGFloat padding = (self.width - 3 * btnWidth) / 4;
        CGFloat buttonX = padding + (btnWidth + padding) * col;
        CGFloat buttonY = padding + (btnWidth + padding) * row;
        button.frame = CGRectMake(buttonX, buttonY, btnWidth, btnHeight);
    }
}

#pragma mark - 懒加载

- (NSMutableArray *)buttonMutableArray {
    
    if (!_buttonMutableArray) {
        _buttonMutableArray = [NSMutableArray array];
    }
    return _buttonMutableArray;
}

@end
