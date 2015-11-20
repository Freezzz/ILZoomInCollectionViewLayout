//
//  ILZoomInCollectionViewLayout.m
//  ILZoomInCollectionViewLayoutDemo
//
//  Created by Ivan Litsvinenka on 20/11/15.
//  Copyright © 2015 net.freezzz. All rights reserved.
//

#import "ILZoomInCollectionViewLayout.h"

@interface ILZoomInCollectionViewLayout ()
@property (strong, nonatomic) NSDictionary *layoutAttributes;
@end

@implementation ILZoomInCollectionViewLayout
const CGFloat featuredHeight = 320.0f;
const CGFloat collapsedHeight = 120.0f;

- (void)prepareLayout {
    
    [super prepareLayout];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    NSInteger featuredIndex = [self currentCellIndex];
    CGFloat featuredCellInterpolation =  [self currentCellIndex] - featuredIndex;
    
    NSMutableDictionary *layoutAttributes = [NSMutableDictionary dictionary];
    NSIndexPath *indexPath;
    
    CGRect lastItemFrame = CGRectMake(0.0f, 0, screenWidth, 0);
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger itemIndex = 0; itemIndex < itemCount; itemIndex++) {
        indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:0];
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        NSInteger yValue = CGRectGetMaxY(lastItemFrame);
        
        if (indexPath.row == featuredIndex) {
            CGFloat amountToGrow = (featuredHeight - collapsedHeight) *featuredCellInterpolation;
            NSInteger newHeight = featuredHeight;
            if (indexPath.row != (itemCount - 1)) {
                newHeight -= amountToGrow;
            }
            
            attributes.frame = CGRectMake(0.0f, yValue, screenWidth, newHeight);
        } else if (indexPath.row == (featuredIndex + 1)) {
            CGFloat amountToGrow = (featuredHeight - collapsedHeight) *featuredCellInterpolation;
            NSInteger newHeight = collapsedHeight + amountToGrow;
            attributes.frame = CGRectMake(0.0f, yValue, screenWidth, newHeight);
        } else {
            attributes.frame = CGRectMake(0.0f, yValue, screenWidth, collapsedHeight);
        }
        
        lastItemFrame = attributes.frame;
        [layoutAttributes setObject:attributes forKey:indexPath];
    }
    
    self.layoutAttributes = layoutAttributes;
}


- (CGSize)collectionViewContentSize {
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat height = (itemCount * collapsedHeight) + (featuredHeight - collapsedHeight) - (self.collectionView.contentInset.top);
    return CGSizeMake(self.collectionView.frame.size.width, height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributesInRect =  [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attributes in [self.layoutAttributes allValues]) {
        if(CGRectIntersectsRect(rect, attributes.frame)){
            [attributesInRect addObject:attributes];
        }
    }
    
    return attributesInRect;
}


- (CGFloat)currentCellIndex {
    CGFloat diff = self.collectionViewContentSize.height - CGRectGetHeight(self.collectionView.frame);
    CGFloat percentScrolled = self.collectionView.contentOffset.y / diff;
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    return MIN(MAX(0, percentScrolled * itemCount), itemCount - 1);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.layoutAttributes[indexPath];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
@end
