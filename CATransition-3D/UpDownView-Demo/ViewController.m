//
//  ViewController.m
//  UpDownView-Demo
//
//  Created by 张建 on 2017/4/24.
//  Copyright © 2017年 JuZiShu. All rights reserved.
//

#import "ViewController.h"
#import "UpDownView.h"
#import "UpDownModel.h"

@interface ViewController ()
{
    NSMutableArray * data;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取数据
    [self getData];
    
   //初始化视图
    [self initUI];
}
- (void)getData{
    
    data = [NSMutableArray array];
    
    NSArray * icon = @[@"1",@"2",@"3"];
    NSArray * title = @[@"我为师师第三第四师师第三四年才弄死哦内搭上",
                        @"能否能看出克拉尼察客户那口 in 反馈啦",
                        @"诋毁富家女次哦你看能否 i 分；麻烦"];
    NSArray * date = @[@"4月",@"5月",@"6月"];
    
    for (int i = 0; i < icon.count; i ++) {
        
        UpDownModel * model = [[UpDownModel alloc] init];
        model.pic = icon[i];
        model.title = title[i];
        model.detail = date[i];
        
        [data addObject:model];
    }
}

- (void)initUI{
    
    UpDownView * view = [[UpDownView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 60)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    [view refreshViewWithDataArr:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
