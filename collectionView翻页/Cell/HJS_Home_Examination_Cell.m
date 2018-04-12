//
//  HJS_Home_Examination_Cell.m
//  aikaola
//
//  Created by wuqiong on 2018/4/11.
//  Copyright © 2018年 wuqiong. All rights reserved.
//

#import "HJS_Home_Examination_Cell.h"

@implementation HJS_Home_Examination_Cell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addUI];
        [self setUIFrame];
        self.contentView.backgroundColor = [UIColor colorWithRed:(arc4random()%255) / 255.0 green:(arc4random()%255 )/ 255.0 blue:(arc4random()%255) / 255.0 alpha:1];
        
        self.layer.contentsScale = [UIScreen mainScreen].scale;
        
        self.layer.shadowOpacity = 0.75f;
        
        self.layer.shadowRadius = 4.0f;
        
        self.layer.shadowOffset = CGSizeMake(10,0);
        
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        
        //设置缓存
        
        self.layer.shouldRasterize = YES;
        
        //设置抗锯齿边缘
        
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
    }
    return self;
}
- (void)addUI
{
    [self.contentView addSubview:self.titleLB];
    UILabel * titleLB = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 100, 100)];
    titleLB.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:titleLB];
}
- (void)setUIFrame
{
    self.titleLB.frame = CGRectMake(0, 0, 100, 100);

}
- (UILabel *)titleLB
{
    if (!_titleLB) {
        _titleLB = [[UILabel alloc]init];
        _titleLB.font = [UIFont systemFontOfSize:15];
        _titleLB.textColor = [UIColor blueColor];
    }
    return _titleLB;
}

@end
