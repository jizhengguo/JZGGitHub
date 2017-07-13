//
//  ZFBBusinessController.m
//  05-口碑
//
//  Created by apple on 2017/7/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBBusinessController.h"
#import "ZFBBusiness.h"
#import "ZFBBusinessCell.h"
#import "ZFBBusinessHeaderView.h"

/**
 1.口碑项目准备"分本地文件夹/把原本的viewController类和Main.sb删除,自己重新创建控制器类,及sb文件/设置类前缀/"
 1.1.注意点:因为把Main.sb删除了,要重新设置main interface 名字最好不要手写,通过选择的方式设置
 
 2. 在SB中拖入一个UITableViewController 设置初始箭头/设置class 注意控制器的继承问题
 
 3.先搭建界面,展示数据/读取plist,进行字典转模型
 
 4.在SB中进行自定义cell,不用做的那么精细,差不多就好,工作时候再认真/昵称15号字,其它 用12号/间距
 
 
 5.创建一个继承至UITableViewCell的类,给SB中的cell指定class
 
 6.把SB的中cell需要设置数据的子控件连线到ZFBBusinessCell.m中,注意子类不要有和父类同名的属性
 
 7.在ZFBBusinessCell.h中定义模型属性,在.m重写模型属性的set方法,在此方法中给子控件设置数据/模型属性用strong
 
 8.在返回cell的数据源方法中,指定cell真实类型,给cell传数据
 
 9.优化cell上面显示的数据问题"让数据看起好看点"/折扣数据小数转换成字符串时可能会出现问题,模型属性换成float类型
 
 
 
 
 10.把levelStar文件拖入到口碑 的view文件夹中,
 10.1 给SB中表示星星view的小view指定class
 10.2 把小星星view连线到ZFBBusinessCell.m, 引入星星view的头文件
 10.3 在模型属性的set方法中给levelStar.level属性赋值
 
 
 11.配图填充模式设置, 等比例缩放完全填充 ,clip to bounds
 
 
 12.设置组头标题及分割线的边距问题
 
 
 13.创建一个xib用来搭建头部视图"第一个imageView  左 顶 右边间距 8  宽高比,在添加约束前先com + = 让imageView自适应下尺寸"
 13.1 下面三张imageView全部左对齐和右对齐/等高   Y间距后一个参照上面一个为8
 
 14.创建一个和xib名称一样的类,把加载xib的细节封装在此类的一个类方法中
 
 
 15.在控制器的viewDidLoad方法中 加载头部视图,注意头部高度问题,计算一个比率高度 交叉相乘
 
 
 16.添加尾部视图, 通过灰度的方式设置颜色 colorWithWhite:传0~1 越小越黑"灰"/越大越偏白
 
 17.修改数据量,然后让数据源方法重新调用  reloadData方法
 
 */
@interface ZFBBusinessController ()
/// 保存所有模型数据
@property (nonatomic, strong) NSMutableArray *businessData;

@end

@implementation ZFBBusinessController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载数据
    [self loadBusinessData];
    
    
    // 界面处理
    [self setupUI];

}


- (void)setupUI {
    // 设置分割线从最左边开始
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    
    // 设置tableView的最头部广告视图
    ZFBBusinessHeaderView *headerView = [ZFBBusinessHeaderView businessHeaderView];
    // xib中的宽320
    // xib中的高为850
    // 显示 出来后的宽为375
    // 显示出来后的高?
    CGFloat headerViewH = self.tableView.bounds.size.width * headerView.bounds.size.height / headerView.bounds.size.width;
    headerView.frame = CGRectMake(0, 0, 0, headerViewH);
    // 设置头部视图
    self.tableView.tableHeaderView = headerView;
    
    
    
    // 添加尾部视图
    UIButton *loadMoreBtn = [[UIButton alloc] init];
    loadMoreBtn.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
    [loadMoreBtn setTitle:@"加载更多" forState:UIControlStateNormal];
    
    // 设置按钮文字颜色
    [loadMoreBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [loadMoreBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    loadMoreBtn.frame = CGRectMake(0, 0, 0, 30);
    
    
    [loadMoreBtn addTarget:self action:@selector(loadMoreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    // 设置尾部视图
    self.tableView.tableFooterView = loadMoreBtn;
    
}

#pragma mark - 按钮点击方法
- (void)loadMoreBtnClick {
    
    // 创建新的模型
    ZFBBusiness *newBusiness = [[ZFBBusiness alloc] init];
    newBusiness.icon = @"xfy";
    newBusiness.name = @"麻辣烫";
    newBusiness.level = 5.0;
    newBusiness.averagePrice = @6;
    newBusiness.distance = @10;
    newBusiness.discount = @"吃一串送一串";
    newBusiness.offNum = 3;
    
    // 把新创建出来的模型添加到可变数组中
    [_businessData addObject:newBusiness];
    
    
    // 刷新 表格
    [self.tableView reloadData];
    
    // 创建当前最后一行的索引
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_businessData.count - 1 inSection:0];
    // 滚动到指定行
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}

#pragma mark - 数据源方法
// 默认就是返回一组,如果只有一组时此方法可以不用实现
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}


// 返回有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 模型的个数就表示行数
    return _businessData.count;
}


// 返回第indexPath.section组的第indexPath.row行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1. 创建cell
    ZFBBusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"business" forIndexPath:indexPath];
    // 2. 设置数据
    cell.businessModel = _businessData[indexPath.row];
    // 3. 返回cell
    return cell;
}

// 页脚
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"  热门推荐";
}



#pragma mark - tableView代理 方法
// 选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消当前选中的那一行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 取消上一次选中的那一行
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消上一次选中的第%zd行", indexPath.row);
}

#pragma mark - 加载数据
- (void)loadBusinessData {
    // 读取plist
    NSArray *dictArr = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"business.plist" withExtension:nil]];
    // 创建可变数组用来保存模型对象
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    
    // block方式进行遍历
    [dictArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
        [arrM addObject:[ZFBBusiness businessWithDict:obj]];
    }];
    // 把装有所有模型的数组赋值给控制器的属性
    _businessData = arrM;
 
}


@end
