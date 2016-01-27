//
//  ViewController.m
//  InstaKilo
//
//  Created by Graeme Harrison on 2016-01-27.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) UICollectionViewFlowLayout *mainLayout;
@property (strong, nonatomic) NSMutableArray *imagesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainLayout = [[UICollectionViewFlowLayout alloc] init];
    self.mainLayout.itemSize = CGSizeMake(100, 100);
    self.mainLayout.minimumInteritemSpacing = 1;
    self.mainLayout.minimumLineSpacing = 1;
    self.mainLayout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
    self.collectionView.collectionViewLayout = self.mainLayout;
    
    self.mainLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 40);
    
    Photo *basketball = [[Photo alloc] initWithSubject:@"people" location:@"outside" andImage:[UIImage imageNamed:@"IMG_2041_2"]];
    Photo *badass = [[Photo alloc] initWithSubject:@"people" location:@"outside" andImage:[UIImage imageNamed:@"IMG_2202_2"]];
    Photo *pumpikin = [[Photo alloc] initWithSubject:@"art" location:@"inside" andImage:[UIImage imageNamed:@"IMG_2382_2"]];
    Photo *nukeEm = [[Photo alloc] initWithSubject:@"art" location:@"inside" andImage:[UIImage imageNamed:@"IMG_2707"]];
    Photo *safari = [[Photo alloc] initWithSubject:@"travel" location:@"inside" andImage:[UIImage imageNamed:@"IMG_2745"]];
    Photo *king = [[Photo alloc] initWithSubject:@"people" location:@"inside" andImage:[UIImage imageNamed:@"IMG_2747_2"]];
    Photo *builder = [[Photo alloc] initWithSubject:@"people" location:@"outside" andImage:[UIImage imageNamed:@"IMG_2816"]];
    Photo *guitar = [[Photo alloc] initWithSubject:@"art" location:@"inside" andImage:[UIImage imageNamed:@"IMG_2819"]];
    Photo *brothers = [[Photo alloc] initWithSubject:@"people" location:@"outside" andImage:[UIImage imageNamed:@"IMG_2984"]];
    Photo *card = [[Photo alloc] initWithSubject:@"art" location:@"inside" andImage:[UIImage imageNamed:@"IMG_3112"]];
    
    self.imagesArray = [[NSMutableArray alloc]initWithObjects: basketball, badass, pumpikin, nukeEm, safari, king, builder, guitar, brothers, card, nil];
}


#pragma mark - UICollectionViewDataSource

// Total number of sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

// Section number
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesArray.count;
}

// Create cells
- (PhotoCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor whiteColor];
    
    Photo *currentObject = self.imagesArray[indexPath.item];
    UIImage *currentImage = currentObject.image;
    
    cell.photoView.image = currentImage;
    cell.photoView.contentMode = UIViewContentModeScaleAspectFill;
    cell.photoView.clipsToBounds = YES;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat addSpace = ((self.collectionView.frame.size.width / 3) - (100 -20)) / 2;
    return CGSizeMake(100 + addSpace, 100 + addSpace);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionHeader" forIndexPath:indexPath];
    }
    return nil;
}

@end
