//
//  ZJJDrawLineView.h
//  ZJJSpeedDashboard
//
//  Created by 张锦江 on 2018/1/5.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJJDrawLineView : UIView

// 需要用这个初始化方法
- (instancetype)initWithFrame:(CGRect)frame;

// 根据当前速度画出仪表盘指针位置
- (void)drawPointerWithSpeed:(int)speed;

@end
