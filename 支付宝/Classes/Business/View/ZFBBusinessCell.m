//
//  ZFBBusinessCell.m
//  05-口碑
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBBusinessCell.h"
#import "ZFBBusiness.h"
#import "HMLevelStar.h"

@interface ZFBBusinessCell ()
/// 配图
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/// 店名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/// 评分
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
/// 人均消费
@property (weak, nonatomic) IBOutlet UILabel *averagePriceLabel;
/// 距离
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
/// 优惠信息
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
/// 折扣
@property (weak, nonatomic) IBOutlet UILabel *offNumLabel;
/// 小星星
@property (weak, nonatomic) IBOutlet HMLevelStar *levelStarView;

/// 减字
@property (weak, nonatomic) IBOutlet UILabel *subtractLabel;

@end
@implementation ZFBBusinessCell


// set方法调用时说明数据已经传递 过来了
- (void)setBusinessModel:(ZFBBusiness *)businessModel {
    _businessModel = businessModel;
    
    
    /// 配图
    _iconView.image = [UIImage imageNamed:businessModel.icon];
//    _iconView.clipsToBounds = YES;
    /// 店名
    _nameLabel.text = businessModel.name;
    /// 评分
    _levelLabel.text = @(businessModel.level).description;
    /// 人均消费
    _averagePriceLabel.text = [NSString stringWithFormat:@"人均消费%@元", businessModel.averagePrice];
    /// 距离
    _distanceLabel.text = [NSString stringWithFormat:@"距离修正大厦 %@m", businessModel.distance];
    /// 优惠信息
    _discountLabel.text = businessModel.discount;
    /// 折扣
    _offNumLabel.text = [NSString stringWithFormat:@"%@折", @(businessModel.offNum)];
    
    
    // 给星星view传分
    _levelStarView.level = businessModel.level;

}

// 当点击cell时此方法也会调用
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置label背景颜色
    self.subtractLabel.backgroundColor = [UIColor orangeColor];
}

@end
