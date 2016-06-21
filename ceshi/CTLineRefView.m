//
//  CTLineRefView.m
//  ceshi
//
//  Created by csc on 16/5/11.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CTLineRefView.h"
#import <CoreText/CoreText.h>
@implementation CTLineRefView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    // Drawing code
    
    NSString * src = @"我真的不想说你了，你怎么就这么不自信，怎么这么懒惰，缺乏思考呢，你个大笨蛋.快点振作起来吧，每天努力做点事情";
    NSMutableAttributedString * mabtring = [[NSMutableAttributedString alloc]initWithString:src];
    [mabtring addAttribute:(id)kCTFontAttributeName value:(id)[UIFont systemFontOfSize:18] range:NSMakeRange(0, mabtring.length)];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mabtring);
    CGMutablePathRef path = CGPathCreateMutable();
    //坐标点在左下角
    CGPathAddRect(path, NULL, CGRectMake(10, 10, self.bounds.size.width-20, self.bounds.size.height-20));
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    
    //得到frame中的行分组
    CFArrayRef rows = CTFrameGetLines(frame);//Returns an array of lines stored in the frame.
    
    if(rows)
    {
        //CFIndex  An integer type used throughout Core Foundation in several programmatic roles: as an array index and for count, size, and length parameters and return values
        
        const CFIndex numberOflines = CFArrayGetCount(rows);
        const CGFloat fontLineHeight = [UIFont systemFontOfSize:18].lineHeight;
        CGFloat textOffset = 0;
        //固定写法
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSaveGState(ctx);
        CGContextTranslateCTM(ctx, rect.origin.x, rect.origin.y+[UIFont systemFontOfSize:18].ascender);
        CGContextSetTextMatrix(ctx, CGAffineTransformMakeScale(1, -1));
        
        for(CFIndex lineNumber = 0; lineNumber<numberOflines; lineNumber++)
        {
            CTLineRef line = CFArrayGetValueAtIndex(rows, lineNumber);
            CGFloat asc,des,lead;
            double lineHeight = CTLineGetTypographicBounds(line, &asc, &des, &lead);
            NSLog(@"ascent = %f,descent = %f,leading = %f,lineheight = %f",asc,des,lead,lineHeight);
            
            CGContextSetTextPosition(ctx, 10, textOffset);
            CTLineDraw(line, ctx);
            textOffset += fontLineHeight;
            
        }
        CGContextRestoreGState(ctx);
        
        
    }
    
    
//    NSString *src = @"其实流程是这样的： 1、生成要绘制的NSAttributedString对象。2、生成要绘制的NSAttributedString对象 3、生成要绘制的对象 ";
//     NSMutableAttributedString * string = [[NSMutableAttributedString alloc]initWithString:src];
//    
//    
//    [string addAttribute:(id)kCTFontAttributeName value:(id)[UIFont systemFontOfSize:20] range:NSMakeRange(0, string.length)];
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSetTextMatrix(ctx , CGAffineTransformIdentity);
//    //CGContextSaveGState(ctx);
//    //x，y轴方向移动
//    CGContextTranslateCTM(ctx , 0 ,self.bounds.size.height);
//    //缩放x，y轴方向缩放，－1.0为反向1.0倍,坐标系转换,沿x轴翻转180度
//    CGContextScaleCTM(ctx, 1.0 ,-1.0);
//    
//    
//    // layout master
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(
//                                                                           (CFAttributedStringRef)string);
//    CGMutablePathRef Path = CGPathCreateMutable();
//    //坐标点在左下角
//    CGPathAddRect(Path, NULL ,CGRectMake(10 , 0 ,self.bounds.size.width-20 , self.bounds.size.height));
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), Path, NULL);
//    CFArrayRef Lines = CTFrameGetLines(frame);
//    long linecount = CFArrayGetCount(Lines);
//    CGPoint origins[linecount];
//    CTFrameGetLineOrigins(frame,
//                          CFRangeMake(0, 0), origins);
//    NSInteger lineIndex = 0;
////    for (id oneLine in (__bridge NSArray *)Lines)
////    {
////        CGRect lineBounds = CTLineGetImageBounds((CTLineRef)oneLine, ctx);
////        lineBounds.origin.x += origins[lineIndex].x;
////        lineBounds.origin.y += origins[lineIndex].y;
////        lineIndex++;
////        //画长方形
////        //设置颜色，仅填充4条边
////        CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
////        //设置线宽为1
////        CGContextSetLineWidth(ctx, 1.0);
////        //设置长方形4个顶点
////        CGPoint poins[] = {CGPointMake(lineBounds.origin.x, lineBounds.origin.y),CGPointMake(lineBounds.origin.x+lineBounds.size.width, lineBounds.origin.y),CGPointMake(lineBounds.origin.x+lineBounds.size.width, lineBounds.origin.y+lineBounds.size.height),CGPointMake(lineBounds.origin.x, lineBounds.origin.y+lineBounds.size.height)};
////        CGContextAddLines(ctx,poins,4);
////        CGContextClosePath(ctx);
////        CGContextStrokePath(ctx);
////    }
////    CTFrameDraw(frame,ctx);
////    
////    CGPathRelease(Path);
////    CFRelease(framesetter);
//    
//    
//    
//    for(int lineIndex = 0;lineIndex < linecount;lineIndex++){
//        
//        CGPoint lineOrigin = origins[lineIndex];
//        
//        CTLineRef line = CFArrayGetValueAtIndex(Lines,lineIndex);
//        
//        CGContextSetTextPosition(ctx,10,lineOrigin.y);
//        
//        CTLineDraw(line,ctx);
//        
//    }
    
  
}


@end
