//
//  CSCoreTextView.m
//  ceshi
//
//  Created by csc on 16/5/12.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSCoreTextView.h"
#import <CoreText/CoreText.h>
#import "NSString+RegularExp.h"
#import "NSArray+NSArrayExp.h"
@implementation CSCoreTextView
{
    NSString * _xinString;
    NSString * _oldString;
    CTTypesetterRef typesetter;
    NSArray * emotionNames;//存放表情名字的数组
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
//获取高度
-(float)getTextHeight;
{
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat y = 0;
    CFIndex start = 0;
    NSInteger length = [_attrEmotionString length];
    
    int tempK = 0;
    while (start <length) {
        CFIndex count = CTTypesetterSuggestClusterBreak(typesetter, start, w);
        CTLineRef line = CTTypesetterCreateLine(typesetter, CFRangeMake(start, count));
        start += count;
        y -= fontHeight+lineSpacing;
        CFRelease(line);
        
        
    }
    return -y;
    
}


-(void)setOldString:(NSString *)oldString andXinString:(NSString *)xinString;
{
    _xinString = xinString;
    _oldString = oldString;
    [self emotiongStrings];
}

-(void)emotiongStrings
{
    // 使用正则表达式查找特殊字符的位置
    NSArray * itemIndexes = [CSRegularExManager itemIndexesWithPattern:EmotionItemPattern inString:_oldString];
    NSArray * names = nil;
    NSArray * newRanges = nil;
    //存放表情图片名字的数组
    names = [_oldString itemsForPattern:EmotionItemPattern captureGroupIndex:1];
    //新的range 
    newRanges = [itemIndexes getNewRangesInArrayBy:[fPlaceholder length]];
    
    emotionNames = names;
    
    _attrEmotionString = [self createAttributedEmotionStringWithRanges:newRanges forString:_xinString];
    //typesetter
    typesetter = CTTypesetterCreateWithAttributedString((CFAttributedStringRef)(_attrEmotionString));
    
    if(_isDraw == NO)
    {
        return;
    }
    [self setNeedsDisplay];
    
}

/**
 *  根据调整后的字符串，生成绘图时使用的 attribute string
 *
 *  @param ranges  占位符的位置数组
 *  @param aString 替换过含有如[em:02:]的字符串
 *
 *  @return 富文本String
 */

-(NSAttributedString *)createAttributedEmotionStringWithRanges:(NSArray *)ranges forString:(NSString *)aString
{
    //初始化并添加属性
    NSMutableAttributedString * attrString = [[NSMutableAttributedString alloc]initWithString:aString];
    [attrString addAttribute:(id)kCTFontAttributeName value:(id)[UIFont systemFontOfSize:15] range:NSMakeRange(0, attrString.string.length)];
    
    [attrString addAttribute:(id)kCTForegroundColorAttributeName value:(id)[UIColor blackColor].CGColor range:NSMakeRange(0, attrString.string.length)];
    
    for (NSInteger i=0; i<ranges.count; i++) {
        NSRange range = NSRangeFromString([ranges objectAtIndex:i]);
        NSString * emotionName = [emotionNames objectAtIndex:i];
        
        [attrString addAttribute:AttributedImageNameKey value:emotionName range:range];
        [attrString addAttribute:(id)kCTRunDelegateAttributeName value:(__bridge id)newEmotionRunDelegate() range:range];
        
    }
    return attrString;
    
}

// 通过表情名获得表情的图片
- (UIImage *)getEmotionForKey:(NSString *)key{
    NSString *nameStr = [NSString stringWithFormat:@"%@.png",key];
    return [UIImage imageNamed:nameStr];
}




CTRunDelegateRef newEmotionRunDelegate(){
    static NSString *emotionRunName = @"emotionRunName";
    
    CTRunDelegateCallbacks imageCallbacks;
    imageCallbacks.version = kCTRunDelegateVersion1;
    imageCallbacks.dealloc = WFRunDelegateDeallocCallback;
    imageCallbacks.getAscent = WFRunDelegateGetAscentCallback;
    imageCallbacks.getDescent = WFRunDelegateGetDescentCallback;
    imageCallbacks.getWidth = WFRunDelegateGetWidthCallback;
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&imageCallbacks,
                                                       (__bridge void *)(emotionRunName));
    
    return runDelegate;}

#pragma mark - Run delegate
void WFRunDelegateDeallocCallback( void* refCon ){
    // CFRelease(refCon);
}

CGFloat WFRunDelegateGetAscentCallback( void *refCon ){
    return 15.0;
}

CGFloat WFRunDelegateGetDescentCallback(void *refCon){
    return 0.0;
}

CGFloat WFRunDelegateGetWidthCallback(void *refCon){
    // EmotionImageWidth + 2 * ImageLeftPadding
    return  19.0;
}

// Only override drawRect: if you perform custom drawing.
// 开始绘制
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if(!typesetter) return;
    
    CGFloat w = CGRectGetWidth(self.frame);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    //翻转坐标系
    Flip_Context(context, fontHeight);
    
    CGFloat y = 0;
    CFIndex start = 0;
    NSInteger length = [_attrEmotionString length];
    int tempK = 0;
    while (start<length) {
        //当前line的 count
        CFIndex count = CTTypesetterSuggestClusterBreak(typesetter, start, w);
        CTLineRef line = CTTypesetterCreateLine(typesetter, CFRangeMake(start, count));
        CGContextSetTextPosition(context, 0, y);
        //画字
        CTLineDraw(line, context);
        //画表情
         Draw_Emoji_For_Line(context, line, self, CGPointMake(0, y));
        
        start += count;
        y -= fontHeight+lineSpacing;
        CFRelease(line);
        tempK ++;
        if(tempK == limitline)
        {
            
        }
        
    }
    UIGraphicsPopContext();
    
}


//绘制每行中的表情
void Draw_Emoji_For_Line(CGContextRef contex,CTLineRef line, id owner,CGPoint lineOrigin)
{
    CFArrayRef runs = CTLineGetGlyphRuns(line);
    //统计有多少个run
    NSInteger count = CFArrayGetCount(runs);
    
    //遍历查找表情run
    for(NSInteger i; i<count; i++)
    {
        CTRunRef aRun = CFArrayGetValueAtIndex(runs, i);
        CFDictionaryRef  attributes = CTRunGetAttributes(aRun);
        NSString * emojiName = (NSString *)CFDictionaryGetValue(attributes, AttributedImageNameKey);
        if(emojiName)
        {
            //画表情
            CGRect imageRect = CGRectZero;
            //表情原点
            imageRect.origin = Emoji_Origin_For_Line(line, lineOrigin, aRun);
            //表情大小
            imageRect.size = CGSizeMake(fontHeight, fontHeight);
            //获取表情图片
            CGImageRef img = [[owner getEmotionForKey:emojiName] CGImage];
            //画图片
            CGContextDrawImage(contex, imageRect, img);    
        }
        
    }
    
    
}

// 生成每个表情的 frame 坐标
static inline
CGPoint Emoji_Origin_For_Line(CTLineRef line, CGPoint lineOrigin, CTRunRef run)
{
    
    //NSLog(@"看看都有啥------%tu",CTRunGetStringRange(run).location);
    
    CGFloat x = lineOrigin.x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location,NULL)+imageLeftPadding;
    CGFloat y = lineOrigin.y - imagetopPadding;
    return CGPointMake(x, y);
}


//翻转坐标系
void Flip_Context(CGContextRef context, CGFloat offset) // offset为字体的高度
{
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -offset);
}

@end
