//
//  ZFBHomeTopView.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBHomeTopView.h"
#import "NSAttributedString+Additon.h"
#import "Masonry.h"

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
    
    UIButton *scanBtn = [self makeHomeTopViewWithImageName:@"home_scan" andBtnWithTitle:@"扫一扫"];
    UIButton *payBtn = [self makeHomeTopViewWithImageName:@"home_pay" andBtnWithTitle:@"付款"];
    UIButton *cardBtn = [self makeHomeTopViewWithImageName:@"home_card" andBtnWithTitle:@"卡券"];
    UIButton *xiuBtn = [self makeHomeTopViewWithImageName:@"home_xiu" andBtnWithTitle:@"咻一咻"];
    
    // 给子控件批处理加相同约束
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
//    [scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//    }];
//    
//    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(scanBtn.mas_right).offset(0);
//        make.width.equalTo(scanBtn.mas_width).offset(0);
//    }];
//    
//    [cardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(payBtn.mas_right).offset(0);
//        make.width.equalTo(payBtn.mas_width).offset(0);
//    }];
//    
//    [xiuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(cardBtn.mas_right).offset(0);
//        make.width.equalTo(cardBtn.mas_width).offset(0);
//        make.right.offset(0);
//    }];
    
    // 此方法是指定间距来间距设置宽或高
    [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    // 此方法是指定宽或高来让间距来设置间距
//    self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:<#(CGFloat)#> leadSpacing:<#(CGFloat)#> tailSpacing:<#(CGFloat)#>
}




- (UIButton *)makeHomeTopViewWithImageName:(NSString *)imageName andBtnWithTitle:(NSString *)title  {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    // 创建属性文本"把图片和文本拼接到一起"富文本
    NSAttributedString *attr = [NSAttributedString imageTextWithImage:[UIImage imageNamed:imageName] imageWH:35 title:title fontSize:14 titleColor:[UIColor whiteColor] spacing:8];
    // 设置按钮的属性文本
    [btn setAttributedTitle:attr forState:UIControlStateNormal];
    
    // 设置按钮中文字换行
    btn.titleLabel.numberOfLines = 0;
    // 设置按钮中文字居中
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:btn];
    
    return btn;
}


@end
