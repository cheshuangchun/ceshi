//
//  CircleView.m
//  ceshi
//
//  Created by csc on 16/5/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CircleView.h"
// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

// 将弧度转换为度数
#define   DEGREES(radian)  ((radian) * 180.f / M_PI)

@interface CircleView ()
/**
 *  图形layer
 */
@property (nonatomic, strong) CAShapeLayer * circleLayer;
@end


@implementation CircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self == [super initWithFrame:frame])
    {
        [self createCircleLayer];
    }
    return self;
}

-(void)createCircleLayer
{
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.frame = self.bounds;
    [self.layer addSublayer:self.circleLayer];
    
}

-(void)buildView
{
    //初始化信息
    CGFloat lineWidthd = self.lineWidth<=0?1:self.lineWidth;
    UIColor *lineColord = (self.lineColor == nil?[UIColor blackColor]:self.lineColor);
    CGSize size = self.bounds.size;
    CGFloat radius = size.width/2.f-lineWidthd/2.f;
    
    //旋转方向
    BOOL clockWise = self.clockWise;
    CGFloat startAngles = 0;
    CGFloat endAngles = 0;
    if(clockWise == YES)
    {
        startAngles = -RADIAN(180-self.startAngle);
        endAngles = RADIAN(180+self.startAngle);
    }else
    {
        startAngles = RADIAN(180-self.startAngle);
        endAngles = -RADIAN(180+self.startAngle);
    }
    
    
//    //创建贝塞尔曲线
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.height/2.f, size.width/2.f) radius:radius startAngle:startAngles endAngle:endAngles clockwise:clockWise];
    
    //获取path
    self.circleLayer.path = circlePath.CGPath;
    
    
    //设置颜色
    self.circleLayer.strokeColor = lineColord.CGColor;
    self.circleLayer.fillColor = [[UIColor clearColor] CGColor];
    self.circleLayer.lineWidth = lineWidthd;
    self.circleLayer.strokeEnd = 0.f;
   
}



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
{
    CircleView * circleView = [[CircleView alloc]initWithFrame:frame];
    circleView.lineWidth = width;
    circleView.lineColor = color;
    circleView.clockWise = clockWise;
    circleView.startAngle = angle;
    return circleView;
}


-(void)strokeEnd:(CGFloat)value animated:(BOOL)animated duration:(CGFloat)duration
{
    CAKeyframeAnimation * keyAnimate = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    keyAnimate.duration = duration;
    
    keyAnimate.values               = \
    [self calculateFrameFromValue:self.circleLayer.strokeEnd
                              toValue:value
                           frameCount:duration * 60];
    
    self.circleLayer.strokeEnd = value;
    [self.circleLayer addAnimation:keyAnimate forKey:nil];
    
}



- (NSArray *)calculateFrameFromValue:(CGFloat)fromValue
                             toValue:(CGFloat)toValue
                          frameCount:(size_t)frameCount {
    
    // 设置帧数量
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:frameCount];
    
    // 计算并存储
    CGFloat t  = 0.0;
    CGFloat dt = 1.0 / (frameCount - 1);
    for(size_t frame = 0; frame < frameCount; ++frame, t += dt) {
        
        // 此处就会根据不同的函数计算出不同的值达到不同的效果
        CGFloat value = fromValue + t * (toValue - fromValue);
        
        // 将计算结果存储进数组中
        [values addObject:[NSNumber numberWithFloat:(float)value]];
    }
    
    //    NSArray * arr = @[@0.1,@0.2,@0.3,@0.4,@0.5];
    //    [values addObjectsFromArray:arr];
    
    // 数组中存储的数据为 NSNumber float 型
    return values;

}


@end
