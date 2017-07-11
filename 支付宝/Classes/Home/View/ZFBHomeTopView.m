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
    
    // 创建及添加四个按钮
    [self makeHomeTopViewWithImageName:@"home_scan" andBtnWithTitle:@"扫一扫" andBtnWithType:ZFBHomeTopViewBtnTypeScan];
    [self makeHomeTopViewWithImageName:@"home_pay" andBtnWithTitle:@"付款" andBtnWithType:ZFBHomeTopViewBtnTypePay];
    [self makeHomeTopViewWithImageName:@"home_card" andBtnWithTitle:@"卡券" andBtnWithType:ZFBHomeTopViewBtnTypeCard];
    [self makeHomeTopViewWithImageName:@"home_xiu" andBtnWithTitle:@"咻一咻" andBtnWithType:ZFBHomeTopViewBtnTypeXiu];
    
    // 给子控件批处理加相同约束
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    
    // 此方法是指定间距来间距设置宽或高
    [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    // 此方法是指定宽或高来让间距来设置间距
//    self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:<#(CGFloat)#> leadSpacing:<#(CGFloat)#> tailSpacing:<#(CGFloat)#>
}




/**
 创建顶部大按钮

 @param imageName 按钮中的图片
 @param title 标题
 @param type tag
 */
- (UIButton *)makeHomeTopViewWithImageName:(NSString *)imageName andBtnWithTitle:(NSString *)title  andBtnWithType:(ZFBHomeTopViewBtnType)type {
    
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
    
    
    // 给按钮添加监听方法
    [btn addTarget:self action:@selector(homeTopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 给按钮设置标记
    btn.tag = type;
    
    return btn;
}


#pragma mark - 按钮点击之后调用的方法
- (void)homeTopBtnClick:(UIButton *)btn {
    
    // 调用方法之前判断代理 方有没有实现协议方法,实现之后再去调用
    if ([self.delegate respondsToSelector:@selector(homeTopView:andBtnClickType:)]) {
        
        // 通知代理去干活
        [self.delegate homeTopView:self andBtnClickType:btn.tag];
    }
    
}

@end
