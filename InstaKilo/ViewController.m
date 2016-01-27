//
//  ViewController.m
//  InstaKilo
//
//  Created by Graeme Harrison on 2016-01-27.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) UICollectionViewFlowLayout *mainLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mainLayout = [[UICollectionViewFlowLayout alloc] init];
    self.mainLayout.itemSize = CGSizeMake(100, 100);
    self.mainLayout.minimumInteritemSpacing = 10;
    self.mainLayout.minimumLineSpacing = 10;
    self.mainLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionView.collectionViewLayout = self.mainLayout;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (PhotoCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionViewLayout == self.mainLayout) {
    
        return CGSizeMake(100 + self.mainLayout.minimumInteritemSpacing, 100 + self.mainLayout.minimumInteritemSpacing);
    }
    return CGSizeZero;
}

@end
