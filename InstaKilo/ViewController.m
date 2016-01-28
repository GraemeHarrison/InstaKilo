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
#import "SectionHeader.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) UICollectionViewFlowLayout *mainLayout;
@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (strong, nonatomic) NSMutableArray *peopleSubject;
@property (strong, nonatomic) NSMutableArray *artSubject;
@property (strong, nonatomic) NSMutableArray *traveleSubject;
@property (strong, nonatomic) NSMutableArray *insideLocation;
@property (strong, nonatomic) NSMutableArray *outsideLocation;
@property (nonatomic, assign) BOOL isSubjectOn;
@property (nonatomic, assign) BOOL isLocationOn;
@property (nonatomic, strong) SectionHeader *sectionHeader;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainLayout = [[UICollectionViewFlowLayout alloc] init];
    self.mainLayout.itemSize = CGSizeMake(100, 100);
    self.mainLayout.minimumInteritemSpacing = 1;
    self.mainLayout.minimumLineSpacing = 1;
    self.mainLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
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
    self.peopleSubject = [NSMutableArray new];
    self.artSubject = [NSMutableArray new];
    self.traveleSubject = [NSMutableArray new];
    self.insideLocation = [NSMutableArray new];
    self.outsideLocation = [NSMutableArray new];
}


#pragma mark - UICollectionViewDataSource

// Total number of sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if (self.isSubjectOn == NO && self.isLocationOn == NO) {
        return 1;
    } else if (self.isSubjectOn){
        return 3;
    } else {
        return 2;
    }
}

// Section number
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.isSubjectOn) {
        if (section == 0) {
            return self.peopleSubject.count;
        } else if (section == 1) {
            return self.artSubject.count;
        } else {
            return self.traveleSubject.count;
        }
    } else if (self.isLocationOn) {
        if (section == 0) {
            return self.insideLocation.count;
        } else {
            return self.outsideLocation.count;
        }
    }
    else {
        return self.imagesArray.count;
    }
}

// Create cells
- (PhotoCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    if (self.isSubjectOn == NO && self.isLocationOn == NO) {
        Photo *currentObject = self.imagesArray[indexPath.item];
        UIImage *currentImage = currentObject.image;
        cell.photoView.image = currentImage;
        cell.photoView.contentMode = UIViewContentModeScaleAspectFill;
        cell.photoView.clipsToBounds = YES;
    } else if (self.isSubjectOn == YES) {
        if (indexPath.section == 0) {
            Photo *currentObject = self.peopleSubject[indexPath.item];
            UIImage *currentImage = currentObject.image;
            cell.photoView.image = currentImage;
            cell.photoView.contentMode = UIViewContentModeScaleAspectFill;
            cell.photoView.clipsToBounds = YES;
        }
        if (indexPath.section == 1) {
            Photo *currentObject = self.artSubject[indexPath.item];
            UIImage *currentImage = currentObject.image;
            cell.photoView.image = currentImage;
            cell.photoView.contentMode = UIViewContentModeScaleAspectFill;
            cell.photoView.clipsToBounds = YES;
        }
        if (indexPath.section == 2) {
            Photo *currentObject = self.traveleSubject[indexPath.item];
            UIImage *currentImage = currentObject.image;
            cell.photoView.image = currentImage;
            cell.photoView.contentMode = UIViewContentModeScaleAspectFill;
            cell.photoView.clipsToBounds = YES;
        }
    }
    
    if (self.isLocationOn == YES) {
        if (indexPath.section == 0) {
            Photo *currentObject = self.insideLocation[indexPath.item];
            UIImage *currentImage = currentObject.image;
            cell.photoView.image = currentImage;
            cell.photoView.contentMode = UIViewContentModeScaleAspectFill;
            cell.photoView.clipsToBounds = YES;
        }
        if (indexPath.section == 1) {
            Photo *currentObject = self.outsideLocation[indexPath.item];
            UIImage *currentImage = currentObject.image;
            cell.photoView.image = currentImage;
            cell.photoView.contentMode = UIViewContentModeScaleAspectFill;
            cell.photoView.clipsToBounds = YES;
        }
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat photoSize = (self.collectionView.frame.size.width-4) / 3;
    return CGSizeMake(photoSize, photoSize);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SectionHeader *section = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionHeader" forIndexPath:indexPath];
        if (self.isSubjectOn == NO && self.isLocationOn == NO) {
            section.sectionLabel.text = @"Photos";
        } else if (self.isSubjectOn) {
            if (indexPath.section == 0) {
                section.sectionLabel.text = @"People";
            } else if (indexPath.section == 1) {
                section.sectionLabel.text = @"Art";
            } else {
                section.sectionLabel.text = @"Travel";
            }
        } else if (self.isLocationOn) {
            if (indexPath.section == 0) {
                section.sectionLabel.text = @"Inside";
            } else if (indexPath.section == 1) {
                section.sectionLabel.text = @"Outside";
            }
        }
        return section;
    }
    return nil;
}

#pragma mark - Sorting

- (IBAction)subjectButton:(UIBarButtonItem *)sender {
    if (self.isSubjectOn == NO) {
        self.isSubjectOn = YES;
        self.isLocationOn = NO;
        [self.insideLocation removeAllObjects];
        [self.outsideLocation removeAllObjects];
        for (Photo *photo in self.imagesArray) {
            if ([photo.subject isEqualToString:@"people"]) {
                [self.peopleSubject addObject:photo];
            } else if ([photo.subject isEqualToString:@"art"]){
                [self.artSubject addObject:photo];
            } else if ([photo.subject isEqualToString:@"travel"]){
                [self.traveleSubject addObject:photo];
            }
    }
    } else {
        self.isSubjectOn = NO;
        [self.peopleSubject removeAllObjects];
        [self.artSubject removeAllObjects];
        [self.traveleSubject removeAllObjects];
    }
    [self.collectionView reloadData];
}

- (IBAction)locationButton:(UIBarButtonItem *)sender {
    if (self.isLocationOn == NO) {
        self.isLocationOn = YES;
        self.isSubjectOn = NO;
        [self.peopleSubject removeAllObjects];
        [self.artSubject removeAllObjects];
        [self.traveleSubject removeAllObjects];
        for (Photo *photo in self.imagesArray) {
            if ([photo.location isEqualToString:@"inside"]) {
                [self.insideLocation addObject:photo];
            } else if ([photo.location isEqualToString:@"outside"]){
                [self.outsideLocation addObject:photo];
            }
        }
    } else {
        self.isLocationOn = NO;
        [self.insideLocation removeAllObjects];
        [self.outsideLocation removeAllObjects];
    }
    [self.collectionView reloadData];
}


@end
