//
//  CSUtils.m
//  ceshi
//
//  Created by csc on 16/5/26.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSUtils.h"

@implementation CSUtils
+ (NSArray *)calculateFrameFromPoint:(CGPoint)fromPoint
                             toPoint:(CGPoint)toPoint
                          frameCount:(size_t)frameCount
{
    // 设置帧数量
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:frameCount];
    
    // 计算并存储
    CGFloat t  = 0.0;
    CGFloat dt = 1.0 / (frameCount - 1);
    for(size_t frame = 0; frame < frameCount; ++frame, t += dt)
    {
        // 此处就会根据不同的函数计算出不同的值达到不同的效果
        CGFloat x = fromPoint.x + t * (toPoint.x - fromPoint.x);
        CGFloat y = fromPoint.y + t * (toPoint.y - fromPoint.y);
        
        // 将计算结果存储进数组中
        [values addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
    }
    
    // 数组中存储的数据为 NSValue CGPoint 型
    return values;
}

+(CGSize)fontsizeMake:(NSString *)str font:(UIFont *)font width:(CGFloat)width{
    
    NSString * tstring = str;
    UIFont * tfont = font;//[UIFont systemFontOfSize:font];
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    // label可设置的最大高度和宽度
    CGSize size =CGSizeMake(width,2000);
    //    获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize =[tstring boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    return actualsize;
}


-(void)drawRadiousImage:(UIImageView *)imageView image:(UIImage *)image cornerRadius:(CGFloat)radius;
{
    //UIImageView * yimage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //[yimage setImage:[UIImage imageNamed:@"bj_boy"]];
    
//    UIImage * image = [UIImage imageNamed:@"bj_boy"];
//    
//    
//    [self.view addSubview:yimage];
    
    
//    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, [UIScreen mainScreen].scale);
//    
//    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:radius] addClip];
//    
//    [image drawInRect:imageView.bounds];
//    
//    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();

}

@end
