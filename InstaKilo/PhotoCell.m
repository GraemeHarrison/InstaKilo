//
//  PhotoCell.m
//  InstaKilo
//
//  Created by Graeme Harrison on 2016-01-27.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photoView = [[UIImageView alloc]init];
        _color = [UIColor whiteColor];
    }
    return self;
}

@end
