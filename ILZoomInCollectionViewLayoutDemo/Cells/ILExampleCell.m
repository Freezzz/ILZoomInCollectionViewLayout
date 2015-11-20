//
//  ILExampleCell.m
//
//
//  Created by Ivan Litsvinenka on 07/10/15.
//  Copyright © 2015 net.freezzz. All rights reserved.
//
#import "ILExampleCell.h"

@interface ILExampleCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation ILExampleCell


- (void)configureWithRowNumber:(NSInteger)rowNumber color:(UIColor *)color {
    self.titleLabel.text = [NSString stringWithFormat:@"ROW NUMBER #%ld", (long)rowNumber];
    self.descriptionLabel.text = [NSString stringWithFormat:@"Description for row the #%ld row.", (long)rowNumber];
    self.contentView.backgroundColor = color;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    CGFloat featureNormaHeightDifference = 320 - 120;
    CGFloat amountGrown = 320 - self.frame.size.height;
    
    CGFloat percentOfGrowth = 1 - (amountGrown / featureNormaHeightDifference);
    percentOfGrowth = sin(percentOfGrowth * M_PI_2);
    
    self.descriptionLabel.alpha = percentOfGrowth > 0.5 ? (percentOfGrowth - 0.5) / 0.5 : 0;
}

@end
