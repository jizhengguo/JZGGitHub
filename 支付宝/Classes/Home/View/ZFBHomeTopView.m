//
//  ZFBHomeTopView.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBHomeTopView.h"
#import "NSAttributedString+Additon.h"

@implementation ZFBHomeTopView

// 添加四个大按钮""
-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UIButton *scanBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    // 创建属性文本"把图片和文本拼接到一起"富文本
    NSAttributedString *attr = [NSAttributedString imageTextWithImage:[UIImage imageNamed:@"home_scan"] imageWH:35 title:@"扫一扫" fontSize:14 titleColor:[UIColor whiteColor] spacing:8];
    // 设置按钮的属性文本
    [scanBtn setAttributedTitle:attr forState:UIControlStateNormal];
    scanBtn.frame = CGRectMake(0, 0, 115, 115);
    
    // 设置按钮中文字换行
    scanBtn.titleLabel.numberOfLines = 0;
    // 设置按钮中文字居中
    scanBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:scanBtn];
    
}



@end
