//
//  PhotoCell.h
//  InstaKilo
//
//  Created by Graeme Harrison on 2016-01-27.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) UIColor *color;

@end
