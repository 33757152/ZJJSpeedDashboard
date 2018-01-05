//
//  MineViewController.m
//  ZJJSpeedDashboard
//
//  Created by 张锦江 on 2018/1/5.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "MineViewController.h"
#import "ZJJDrawLineView.h"

@interface MineViewController () {
    ZJJDrawLineView *_dashboardView;
    UITextField *_inputSpeedTF;
}

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"驾驶室";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatView];
}

- (void)creatView {
    _dashboardView = [[ZJJDrawLineView alloc] initWithFrame:CGRectMake(30, 88, SCREEN_WIDTH-60, SCREEN_WIDTH-60)];
    [_dashboardView drawPointerWithSpeed:0];
    [self.view addSubview:_dashboardView];
  
    _inputSpeedTF = [UITextField new];
    _inputSpeedTF.frame = CGRectMake(20, 30+_dashboardView.frame.origin.y+_dashboardView.frame.size.height, SCREEN_WIDTH-40, 40);
    _inputSpeedTF.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_inputSpeedTF];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 30+_inputSpeedTF.frame.origin.y+_inputSpeedTF.frame.size.height, SCREEN_WIDTH-200, 50);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"速度" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(comeOut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)comeOut {
    if ([_inputSpeedTF.text isEqualToString:@"240"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"你要死啊!!" delegate:nil cancelButtonTitle:@"不想" otherButtonTitles:nil, nil];
        [alert show];
    }else {
        [_dashboardView drawPointerWithSpeed:[_inputSpeedTF.text intValue]];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
