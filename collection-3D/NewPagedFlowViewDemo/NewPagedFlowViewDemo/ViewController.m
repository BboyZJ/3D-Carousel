//
//  ViewController.m
//  NewPagedFlowViewDemo
//
//  Copyright © 2016年 Mars. All rights reserved.
//  Designed By PageGuo,
//  QQ:799573715
//  github:https://github.com/PageGuo/NewPagedFlowView

#import "ViewController.h"
#import "TestViewController.h"

#define Width [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"viewController";
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton * pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [pushBtn setTitle:@"next" forState:UIControlStateNormal];
    pushBtn.backgroundColor = [UIColor cyanColor];
    [pushBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}

#pragma mark --push控制器
- (void)pushVC {
    
    TestViewController *testVC = [[TestViewController alloc] init];
    
    [self.navigationController pushViewController:testVC animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
