//
//  GMView.m
//  UIBezierPath详解
//
//  Created by Xinxibin on 16/7/18.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

#import "GMView.h"
#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@implementation GMView

// 请使用 6 6s 模拟器 没有适配

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 绘制矩形实心
    [[UIColor yellowColor]setFill];
    UIRectFill(CGRectMake(20, 20, 100, 100));
    
    // 绘制一个长方形 空心
    UIColor * color = [UIColor blueColor];
    [color set];
    UIBezierPath * path2 = [UIBezierPath bezierPathWithRect:CGRectMake(140, 20, 100, 100)];
    path2.lineWidth = 4;
    path2.lineJoinStyle = kCGLineJoinRound;
    path2.lineCapStyle =  kCGLineCapRound;
    [path2 stroke];

    // 画一个椭圆
    UIColor * color3 = [UIColor redColor];
    [color3 set];
    UIBezierPath * path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(260, 20, 100, 100) cornerRadius:30];
    path3.lineWidth = 4;
    path3.lineCapStyle  = kCGLineCapButt;
    path3.lineJoinStyle = kCGLineJoinRound;
    [path3 stroke];
    
    // 创建可以指定圆角位置的矩形  byRoundingCorners 枚举值 四个类型
    UIBezierPath * path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 140, 100, 100) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    [path4 stroke];
    
    // 创建圆弧 (整个圆 只需要结束角度为360 即可)
    UIBezierPath * path5 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(190, 190) radius:50 startAngle:0 endAngle:M_PI clockwise:true];
    [[UIColor purpleColor] set];
    [path5 stroke];
    
//    // 通过已知路径绘制路径
//    UIBezierPath * path6 = [UIBezierPath bezierPathWithCGPath:path5.CGPath];
//    path6.lineWidth = 5;
//    [[UIColor blackColor] set];
//    [path6 stroke];

    // 绘制直线
    UIBezierPath * path6 = [UIBezierPath bezierPath];
    [path6 moveToPoint:CGPointMake(260, 140)];
    [path6 addLineToPoint:CGPointMake(360, 240)];
    [[UIColor grayColor] set];
    [path6 stroke];
    
   
    // 绘制曲线 - 1   二次贝塞尔曲线
    UIBezierPath * path7 = [UIBezierPath bezierPath];
    path7.lineWidth = 4;
    path7.lineCapStyle  = kCGLineCapRound;
    path7.lineJoinStyle = kCGLineJoinRound;
    // 起点
    [path7 moveToPoint:CGPointMake(20,300)];
    // toPoint：终点坐标  controlPoint： 弧度点
    [path7 addQuadCurveToPoint:CGPointMake(120, 300) controlPoint:CGPointMake(70, 230)];
    [path7 stroke];
    

    // 绘制三次贝塞尔曲线
    UIBezierPath *path8 = [UIBezierPath bezierPath];
    [[UIColor blueColor] set];
    path8.lineWidth = 4;
    path8.lineCapStyle = kCGLineCapRound;
    path8.lineJoinStyle = kCGLineJoinRound;
    [path8 moveToPoint:CGPointMake(140, 300)];
    [path8 addCurveToPoint:CGPointMake(340, 300)
             controlPoint1:CGPointMake(190, 200)
             controlPoint2:CGPointMake(290, 400)];
    [path8 stroke];
    
    // 绘制弧形线段
    UIBezierPath * path9 = [UIBezierPath bezierPath];
    [path9 addArcWithCenter:CGPointMake(60, 320) radius:50 startAngle:0 endAngle:M_PI_4 * 3 clockwise:true];
    [[UIColor redColor]set];
    path9.lineWidth = 3;
    [path9 stroke];
    
    /* 这两个方法不知道怎么用 有人会用的话 请告知
     
     - (void)appendPath:(UIBezierPath *)bezierPath
     - (void)applyTransform:(CGAffineTransform)transform
     
     */
    
    // 创建虚线
    UIBezierPath *path10 = [UIBezierPath bezierPath];
    [path10 moveToPoint:CGPointMake(20, 400)];
    [path10 addLineToPoint:CGPointMake(100, 400)];
    CGFloat dashStyle[] = {1.0f, 2.0f};
    [path10 setLineDash:dashStyle count:2 phase:0.0];
    [path10 stroke];

    // 设置描边混合模式
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(140, 300, 100, 100)];
    [[UIColor greenColor] setStroke];
    path.lineWidth = 10.0f;
    // strokeWithBlendMode 是一个枚举类型
    [path strokeWithBlendMode:kCGBlendModeColorDodge alpha:1.0];
    [path stroke];

    // 设置描边混合模式
    UIBezierPath *path11 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(260, 340, 100, 100)];
    [[UIColor redColor] setFill];
    [path11 fillWithBlendMode:kCGBlendModeSaturation alpha:0.6];
    [path11 fill];
    

}


@end
