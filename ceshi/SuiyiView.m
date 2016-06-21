//
//  SuiyiView.m
//  ceshi
//
//  Created by csc on 16/5/20.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "SuiyiView.h"

@implementation SuiyiView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    //UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, CSWidth-40, CSHeight-40)];
//    //UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, CSWidth-40, CSWidth-40)];
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) byRoundingCorners:UIRectCornerTopRight|UIRectCornerTopLeft cornerRadii:CGSizeMake(60, 60)];
//    
//    path.lineWidth = 1.;
//    path.lineCapStyle = kCGLineCapRound;
//    path.lineJoinStyle = kCGLineJoinBevel;
//    
//    //设置填充颜色
//    UIColor * fillColor = [UIColor greenColor];
//    [fillColor set];
//    [path fill];
//    
//    //设置画笔颜色
//    UIColor * strokeColor = [UIColor blueColor];
//    [strokeColor set];
//    
//    //根据设置的各个点连线
//    [path stroke];
//}

-(void)drawRect:(CGRect)rect
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    //首先设置一个起点
    [path moveToPoint:CGPointMake(20, CSHeight-100)];
    //添加二次曲线
    
    [path addQuadCurveToPoint:CGPointMake(CSWidth-20, CSHeight-100) controlPoint:CGPointMake(CSWidth/2., 0)];
    
    path.lineWidth = 5.;
    
    UIColor * strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
    
    
}


@end
