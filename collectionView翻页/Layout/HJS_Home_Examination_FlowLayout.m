//
//  HJS_Home_Examination_FlowLayout.m
//  aikaola
//
//  Created by wuqiong on 2018/4/11.
//  Copyright © 2018年 wuqiong. All rights reserved.
//

#import "HJS_Home_Examination_FlowLayout.h"

@implementation HJS_Home_Examination_FlowLayout
{
    CGFloat ActiveDistance;//垂直缩放除以系数
    CGFloat ScaleFactor;   //缩放系数  越大缩放越大
}

//在这里初始化数据
- (void)prepareLayout
{
    [super prepareLayout];
    ActiveDistance = 400;
    ScaleFactor    = .25;
    
}

////返回滑动后的内容偏移量（滑动所停止的点），默认返回proposedContentOffset参数的值，可以在这里返回我们实际需要的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    NSLog(@"wnnwnw");

    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
//
//    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
//    // 目标区域中包含的cell
//    NSArray * attriArray = [super layoutAttributesForElementsInRect:targetRect];
//    // collectionView落在屏幕中点的x坐标
//    CGFloat horizontalCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width/2.0;
//    CGFloat offsetAdjustment = CGFLOAT_MAX;
//
//    for (UICollectionViewLayoutAttributes * layoutAttributes in attriArray) {
//        CGFloat itemHorizontalCenterX = layoutAttributes.center.x;
//        // 找出离中心点最近的
//        if (ABS(itemHorizontalCenterX - horizontalCenterX)<ABS(offsetAdjustment)) {
//            offsetAdjustment = itemHorizontalCenterX - horizontalCenterX;
//        }
//    }
//
//    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}
//返回在给定的范围（rectangle）内所有cell的布局属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    CGRect visibleRect = CGRectZero;
    NSArray * array    = [self getCopyOfAttributes:[super layoutAttributesForElementsInRect:rect]];
    
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size   = self.collectionView.bounds.size;
    NSInteger num = visibleRect.origin.x / self.collectionView.frame.size.width;
    NSLog(@"%lf",visibleRect.origin.x);
    for (int i = 0; i<array.count; i++) {
        UICollectionViewLayoutAttributes * attributes = array[i];
        attributes.zIndex = -attributes.indexPath.item;
        
        if (visibleRect.origin.x < 0) {
            continue;
        }
        
        if (attributes.indexPath.item == num + 1) {
            CGRect frame = attributes.frame;
            frame.origin.x =visibleRect.origin.x;
            attributes.frame = frame;
        }
        if (attributes.indexPath.item <= num)
        {
            attributes.zIndex = attributes.indexPath.item;
        }
        
        
    }
    return array;
}


//询问是否在显示的边界发生改变就进行重新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    // 滑动放大缩小  需要实时刷新layout
    return  YES;
}
//防止快速滑动时崩溃
- (NSArray <UICollectionViewLayoutAttributes *> * )getCopyOfAttributes:(NSArray <UICollectionViewLayoutAttributes *> *)attributes
{
    NSMutableArray * arr = [NSMutableArray new];
    if (attributes.count) {
        for (UICollectionViewLayoutAttributes *attribute in attributes) {
            [arr addObject:attribute.copy];
        }
        return arr;
    }
    return nil;
    
}
@end
