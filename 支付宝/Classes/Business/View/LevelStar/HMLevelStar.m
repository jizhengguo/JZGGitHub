//
//  HMLevelStar.m
//  03-星级评价
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "HMLevelStar.h"

@implementation HMLevelStar

// 当一个视图从xib或sb中创建出来,创建完成之后就会自动调用此方法
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}



// 用代码方式创建的时候会调用此方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

// 创建及添加5个空星
- (void)setupUI {
    for (NSInteger i = 0; i < 5; i++) {
        // 创建星星imageView并且设置空星图片
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"empty_star"]];
        // 计算x
        CGFloat imageViewX = imageView.image.size.width * i;
        // 设置frame
        imageView.frame = (CGRect){{imageViewX, 0}, imageView.image.size};
        
        // 添加到父控件上
        [self addSubview:imageView];
    }
}

- (void)setLevel:(CGFloat)level {
    _level = level;
    // 让数组中的每一个对应都执行一次后面的方法
//    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
 
    if (level > 5.0) {
        level = 5;
    } else if (level < 0) {
        level = 0;
    }
    
    // 1.满星
    // 把传过来的分数只保留整数,整数 就是满星的个数
    NSInteger fullStarCount = (NSInteger)level;
    
    // 循环来创建满星
    for (NSInteger i = 0; i < fullStarCount; i++) {
        
        // 设置满星
        [self makeLevelStarWithImageName:@"full_star" andPosition:i];
    }
    
    
    
    // 2.半星
    if (level - fullStarCount) {
        // 添加一个半星
        [self makeLevelStarWithImageName:@"half_star" andPosition:fullStarCount];

        // 如果添加过半星,让它加加,用来表示已经添加的星星总个数
        fullStarCount++;
    }
    
    
    // 3.空星
    for (NSInteger i = fullStarCount; i < 5; i++) {
        
        // 设置空星
        [self makeLevelStarWithImageName:@"empty_star" andPosition:i];

    }
    
    
    
}


/**
 创建星星

 @param imageName 星星的图片名称
 @param p 星星的位置
 */
- (void)makeLevelStarWithImageName:(NSString *)imageName andPosition:(NSInteger)p {
    /**
    // 创建星星imageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    CGFloat imageViewX = imageView.image.size.width * p;
    // 设置frame
//    imageView.frame = CGRectMake(imageViewX, 0, imageView.image.size.width, imageView.image.size.height);
    
    
    imageView.frame = (CGRect){{imageViewX, 0}, imageView.image.size};
     [self addSubview:imageView];
     */
    
    // 获取 指定位置的星星
   UIImageView *imageView = self.subviews[p];
    
    // 重新设置数据
    imageView.image = [UIImage imageNamed:imageName];
    
}

@end
