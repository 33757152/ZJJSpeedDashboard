//
//  ZJJDrawLineView.m
//  ZJJSpeedDashboard
//
//  Created by 张锦江 on 2018/1/5.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ZJJDrawLineView.h"

@interface ZJJDrawLineView (){
    // 指针层，设全局方便移除
    CAShapeLayer *_lineLayer;
}

@property (nonatomic, assign) float view_width;
@property (nonatomic, assign) float view_height;
@property (nonatomic, assign) float r;
@property (nonatomic, strong) UILabel *speedLabel;

@end

@implementation ZJJDrawLineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.view_width = frame.size.width;
        self.view_height = frame.size.height;
        self.backgroundColor = [UIColor blackColor];
        [self drawDashboard];
    }
    return self;
}

- (void)drawDashboard {
    self.r = (_view_width-40)/2;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(_view_width/2, _view_height/2) radius:self.r startAngle:M_PI/3 endAngle:2*M_PI/3 clockwise:NO];
    [bezierPath closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.strokeColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:layer];
        // 画刻度
    [self calibrationUnit];
        // 画中间的KM/H
    [self addKilometersPerHour];
        // 展示速度
    [self addSubview:self.speedLabel];
}

- (void)drawPointerWithSpeed:(int)speed {
    if (speed<0 || speed>240) {
        speed = 0;
    }
    self.speedLabel.text = [NSString stringWithFormat:@"%d",speed];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(_view_width/2, _view_height/2)];
    [bezierPath addLineToPoint:CGPointMake(_view_width/2-_r*sin((60+speed)*M_PI/180),_view_height/2+_r*cos((60+speed)*M_PI/180))];
    [_lineLayer removeFromSuperlayer];
    _lineLayer = [CAShapeLayer layer];
    _lineLayer.path = bezierPath.CGPath;
    _lineLayer.lineWidth = 3.0f;
    _lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:_lineLayer];
}

- (void)calibrationUnit {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    for (int i = 0; i<25; i++) {
            // 画刻度
        float unitLength = _r-10;
        if (i%2 == 0) {
            unitLength = _r-15;
        }
        [bezierPath moveToPoint:CGPointMake(_view_width/2-unitLength*sin((60+10*i)*M_PI/180), _view_height/2+unitLength*cos((60+10*i)*M_PI/180))];
        [bezierPath addLineToPoint:CGPointMake(_view_width/2-_r*sin((60+10*i)*M_PI/180), _view_height/2+_r*cos((60+10*i)*M_PI/180))];
            // 标数字
        UILabel *label = [[UILabel alloc] init];
        label.center = CGPointMake(_view_width/2-(unitLength-20)*sin((60+10*i)*M_PI/180), _view_height/2+(unitLength-20)*cos((60+10*i)*M_PI/180));
        label.bounds = CGRectMake(0, 0, 80, 80);
        label.text = [NSString stringWithFormat:@"%d",i*10];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        if (_view_width <= 320) {
            label.font = [UIFont systemFontOfSize:15 weight:0.3];
        }else if (_view_width <= 375) {
            label.font = [UIFont systemFontOfSize:17 weight:0.4];
        }else if (_view_width <= 414) {
            label.font = [UIFont systemFontOfSize:20 weight:0.5];
        }
        label.adjustsFontSizeToFitWidth = YES;
        if (i%2 == 0) {
            [self addSubview:label];
        }
    }
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezierPath.CGPath;
    layer.lineWidth = 5.0f;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:layer];
}

- (void)addKilometersPerHour {
    UILabel *label = [[UILabel alloc] init];
    label.center = CGPointMake(_view_width/2, _view_height/2-60);
    label.bounds = CGRectMake(0, 0, 100, 50);
    label.text = @"km/h";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22 weight:0.5];
    [self addSubview:label];
}

- (UILabel *)speedLabel {
    if (!_speedLabel) {
        _speedLabel = [[UILabel alloc] init];
        _speedLabel.center = CGPointMake(_view_width/2, _view_height/2+80);
        _speedLabel.bounds = CGRectMake(0, 0, 70, 50);
        _speedLabel.text = @"0";
        _speedLabel.textColor = [UIColor whiteColor];
        _speedLabel.textAlignment = NSTextAlignmentCenter;
        _speedLabel.font = [UIFont systemFontOfSize:22 weight:0.5];
    }
    return _speedLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
