//
//  ViewController.m
//  ZJJSpeedDashboard
//
//  Created by 张锦江 on 2018/1/5.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ViewController.h"
#import "MineViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, SCREEN_WIDTH-20, 50);
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:@"仪表盘" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(comeOut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)comeOut {
    MineViewController *vc = [MineViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
