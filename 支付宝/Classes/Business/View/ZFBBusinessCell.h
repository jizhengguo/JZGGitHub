//
//  ZFBBusinessCell.h
//  05-口碑
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFBBusiness;
@interface ZFBBusinessCell : UITableViewCell

/// 模型属性用来接收数据,有了数据后就给cell里面的子控件设置数据
@property (nonatomic, strong) ZFBBusiness *businessModel;
@end
