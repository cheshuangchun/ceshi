//
//  CSCAdView.m
//  ceshi
//
//  Created by csc on 16/6/14.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSCAdView.h"
static CGFloat const  picHeight = 200.f;
@interface CSCAdView()<UIScrollViewDelegate>
{
    UIScrollView * adScrollView;
    UIPageControl * pageControl;
}
@end


@implementation CSCAdView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {

        self.imgArray = [[NSMutableArray alloc]initWithCapacity:1];
        [self createView];
        //[self registerForKVO];
        
    }
    return self;
}


-(void)createView
{
    adScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CSWidth, picHeight)];
    adScrollView.showsHorizontalScrollIndicator = NO;
    adScrollView.showsVerticalScrollIndicator = NO;
    adScrollView.delegate = self;
    
    [self addSubview:adScrollView];
    adScrollView.pagingEnabled= YES;
    
    
}



/**
 *  更新图片显示
 */
-(void)updateScrollView
{
    NSArray * tempArr = [self.imgArray copy];
    if(tempArr.count>2){
        [self.imgArray addObject:[tempArr firstObject]];
        [self.imgArray insertObject:[tempArr lastObject] atIndex:0];
    }
    
    
    
    
    for (NSInteger i = 0; i<self.imgArray.count; i++) {
        UIImageView * pic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imgArray[i]]];
        pic.frame = CGRectMake(i*CSWidth, 0, CSWidth, picHeight);
        [adScrollView addSubview:pic];
    }
    
    [adScrollView setContentSize:CGSizeMake(CSWidth*self.imgArray.count, picHeight)];
    
    if(tempArr.count>2)
    {
        [adScrollView setContentOffset:CGPointMake(CSWidth, 0) animated:NO];
    }
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    
    if(offsetX > (CSWidth*(self.imgArray.count-1)))
    {
        [adScrollView setContentOffset:CGPointMake(CSWidth, 0) animated:NO];
    }else if (offsetX <= 0)
    {
        [adScrollView setContentOffset:CGPointMake(CSWidth*(self.imgArray.count-2), 0) animated:NO];
    }
    
    
    
}





#pragma mark - KVO

- (void)registerForKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)unregisterFromKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}

- (NSArray *)observableKeypaths {
    return [NSArray arrayWithObjects:@"mode",@"textOnly",@"imgArray", nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //    if (![NSThread isMainThread]) {
    //        [self performSelectorOnMainThread:@selector(updateUIForKeypath:) withObject:keyPath waitUntilDone:NO];
    //    } else {
    //        [self updateUIForKeypath:keyPath];
    //    }
    
    [self updateScrollView];
    
}




-(void)dealloc
{
    [self unregisterFromKVO];
}

@end
