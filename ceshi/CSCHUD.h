//
//  CSCHUD.h
//  ceshi
//
//  Created by csc on 16/6/13.
//  Copyright © 2016年 csc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCHUD : UIView
{
    CGSize  size;
    UIView * cornerView;
}
@property (strong, nonatomic) UIColor * color;

@property (assign, nonatomic) CGFloat opacity;

@property (assign, nonatomic) CGFloat cornerRadius;

@property (strong, nonatomic) NSString * content;

@property (strong, nonatomic) UILabel * contentLabel;
/**
 *  是否只有文字
 */
@property (assign, nonatomic) BOOL textOnly;

@property (strong, nonatomic) UIActivityIndicatorView * indicatior;

-(instancetype)initWithView:(UIView *)view;

-(void)show:(BOOL)animated;
@end
