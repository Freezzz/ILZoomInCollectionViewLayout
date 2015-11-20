//
//  ViewController.m
//  ILZoomInCollectionViewLayoutDemo
//
//  Created by Ivan Litsvinenka on 20/11/15.
//  Copyright © 2015 net.freezzz. All rights reserved.
//

#import "ViewController.h"
#import "ILExampleCell.h"
@interface ViewController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *colors;
@end

@implementation ViewController

static NSString * const CellIdentifier = @"ILExampleCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.collectionView registerNib:[UINib nibWithNibName:@"ILExampleCell" bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
    
    self.colors = @[
                    [self colorWithHexRGB:0xffe57373],
                    [self colorWithHexRGB:0xfff06292],
                    [self colorWithHexRGB:0xffba68c8],
                    [self colorWithHexRGB:0xff9575cd],
                    [self colorWithHexRGB:0xff7986cb],
                    [self colorWithHexRGB:0xff64b5f6],
                    [self colorWithHexRGB:0xff4fc3f7],
                    [self colorWithHexRGB:0xff4dd0e1],
                    [self colorWithHexRGB:0xff4db6ac],
                    [self colorWithHexRGB:0xff81c784],
                    [self colorWithHexRGB:0xffaed581],
                    [self colorWithHexRGB:0xffff8a65],
                    [self colorWithHexRGB:0xffd4e157],
                    [self colorWithHexRGB:0xffffd54f],
                    [self colorWithHexRGB:0xffffb74d],
                    [self colorWithHexRGB:0xffa1887f],
                    [self colorWithHexRGB:0xff90a4ae]
                    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.colors.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ILExampleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell configureWithRowNumber:indexPath.row color:self.colors[indexPath.row]];
    return cell;
}


#pragma mark - Utils
- (UIColor *)colorWithHexRGB:(unsigned)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}
@end
