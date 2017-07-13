//
//  ZFBBusiness.m
//  05-口碑
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBBusiness.h"

@implementation ZFBBusiness
+ (instancetype)businessWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
@end
