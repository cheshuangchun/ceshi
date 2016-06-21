//
//  CSCHUD.m
//  ceshi
//
//  Created by csc on 16/6/13.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "CSCHUD.h"
static const CGFloat indicatorWidth = 50;
@implementation CSCHUD

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.opaque = NO;
        self.opacity = 0.8;
        self.cornerRadius = 10;
        self.color = [UIColor purpleColor];
        size = CGSizeMake(77, 77);
        self.alpha = 0.f;
        
        [self registerForKVO];
    }
    
    return self;
}




-(instancetype)initWithView:(UIView *)view;
{
    return [self initWithFrame:view.frame];
}

-(void)layoutSubviews
{
    
    for (UIView * view in self.subviews) {
        [view removeFromSuperview];
    }
    
 
    CGRect allRect = self.bounds;
    cornerView = [[UIView alloc]initWithFrame:CGRectMake(round((allRect.size.width-size.width)/2), round((allRect.size.height-size.height)/2), size.width, size.height)];
    cornerView.layer.cornerRadius = self.cornerRadius;
    cornerView.backgroundColor = self.color;
    [self addSubview:cornerView];

    if(self.textOnly)
    {
        
        CGSize rectSize = [CSUtils fontsizeMake:self.content font:[UIFont systemFontOfSize:14] width:allRect.size.width-80];
        cornerView.frame = CGRectMake(round((allRect.size.width-rectSize.width-5)/2), round((allRect.size.height-rectSize.height)/2), rectSize.width+10, rectSize.height+10);
        cornerView.layer.cornerRadius = 5;
        
        self.contentLabel = [[UILabel alloc]init];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.textColor = [UIColor whiteColor];
        self.contentLabel.text = self.content;
        self.contentLabel.frame = CGRectMake(5, 5, rectSize.width, rectSize.height);
        [cornerView addSubview:self.contentLabel];
        
        
        
    }else
    {
        self.indicatior = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.indicatior startAnimating];
        self.indicatior.frame = CGRectMake((cornerView.bounds.size.width-indicatorWidth)/2, (cornerView.bounds.size.height-indicatorWidth)/2, indicatorWidth, indicatorWidth);
        [cornerView addSubview:self.indicatior];
        [self.indicatior setColor:[UIColor whiteColor]];
    }
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


/**
 *  显示
 *
 *  @param animated <#animated description#>
 */
-(void)show:(BOOL)animated;
{
    self.alpha = 1.f;
    [self performSelector:@selector(hideSelf) withObject:nil afterDelay:3];
}

-(void)hideSelf
{
    self.alpha = 0.03f;
    [self removeFromSuperview];
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
    return [NSArray arrayWithObjects:@"mode", @"customView", @"labelText", @"labelFont", @"labelColor",
            @"detailsLabelText", @"detailsLabelFont", @"detailsLabelColor", @"progress", @"activityIndicatorColor",@"textOnly", nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    if (![NSThread isMainThread]) {
//        [self performSelectorOnMainThread:@selector(updateUIForKeypath:) withObject:keyPath waitUntilDone:NO];
//    } else {
//        [self updateUIForKeypath:keyPath];
//    }
}

- (void)updateUIForKeypath:(NSString *)keyPath {
    if ([keyPath isEqualToString:@"textOnly"]) {
        
    }
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

-(void)dealloc
{
    [self unregisterFromKVO];
}

@end
