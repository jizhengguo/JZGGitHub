//
//  ZFBBusiness.h
//  05-口碑
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFBBusiness : NSObject

/// 配图
@property (nonatomic, copy) NSString *icon;
/// 店名
@property (nonatomic, copy) NSString *name;
/// 评价
@property (nonatomic, assign) CGFloat level;// 用KVC在给对象属性赋值时,它可以把NSNumber类型自动转换为基本数据类型
/// 人均消费
@property (nonatomic, strong) NSNumber *averagePrice;
/// 折扣
@property (nonatomic, assign) float offNum;
/// 距离
@property (nonatomic, strong) NSNumber *distance;
/// 优惠信息
@property (nonatomic, copy) NSString *discount;


+ (instancetype)businessWithDict:(NSDictionary *)dict;
@end
