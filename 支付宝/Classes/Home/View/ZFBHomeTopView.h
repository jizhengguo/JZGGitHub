//
//  ZFBHomeTopView.h
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 委托方要做的四个事情:
 1.定义协议"协议名称命名规范" 以委托者类名  + Delegate  代理 方法全是可选实现
 2.声明一个代理方法  规范"此方法最少要有一个参数 把委托者自己传过去"方法名一般以委托者类名不加前缀首字母小写
 3.定义一个代理 属性  代理 属性用id类型  代理属性用weak
 //以上三步是在委托方的.h做的
 
 4.在合适位置通知代理 做事情
 */
typedef enum : NSUInteger {
    ZFBHomeTopViewBtnTypeScan = 1,
    ZFBHomeTopViewBtnTypePay,
    ZFBHomeTopViewBtnTypeCard,
    ZFBHomeTopViewBtnTypeXiu
} ZFBHomeTopViewBtnType;
// 枚举类型命名规范: 枚举定义在那个类里面就以类名开头

@class ZFBHomeTopView;


@protocol ZFBHomeTopViewDelegate <NSObject>

@optional

- (void)homeTopView:(ZFBHomeTopView *)homeTopView andBtnClickType:(ZFBHomeTopViewBtnType)type;

@end
@interface ZFBHomeTopView : UIView
@property (nonatomic, weak) id<ZFBHomeTopViewDelegate> delegate;


@end
