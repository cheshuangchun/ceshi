//
//  CircleView.h
//  ceshi
//
//  Created by csc on 16/5/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
/**
 *  线条宽度
 */
@property (nonatomic)   CGFloat lineWidth;
/**
 *  线条颜色
 */
@property (nonatomic, strong) UIColor * lineColor;
/**
 *  旋转方向
 */
@property (nonatomic) BOOL clockWise;
/**
 *  开始角度
 */
@property (nonatomic) CGFloat startAngle;

/**
 *  初始化view
 */
-(void)buildView;

/**
 *  实例化对象
 *
 *  @param frame     <#frame description#>
 *  @param width     <#width description#>
 *  @param color     <#color description#>
 *  @param clockWise <#clockWise description#>
 *  @param angle     <#angle description#>
 *
 *  @return <#return value description#>
 */
+(instancetype)circleViewWithFrame:(CGRect)frame
                         lineWidth:(CGFloat)width
                         lineColor:(UIColor *)color
                         clockWise:(BOOL)clockWise
                        startAngle:(CGFloat)angle;
/**
 *  开始画圆圈
 *
 *  @param value    <#value description#>
 *  @param animated <#animated description#>
 *  @param duration <#duration description#>
 */
-(void)strokeEnd:(CGFloat)value animated:(BOOL)animated duration:(CGFloat)duration;

@end
