//
//  ZFBBusinessHeaderView.m
//  05-口碑
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBBusinessHeaderView.h"

@implementation ZFBBusinessHeaderView

+ (instancetype)businessHeaderView {
    return [[[UINib nibWithNibName:@"ZFBBusinessHeaderView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}

@end
