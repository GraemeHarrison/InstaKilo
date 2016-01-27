//
//  Photo.m
//  InstaKilo
//
//  Created by Graeme Harrison on 2016-01-27.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithSubject:(NSString *)subject location:(NSString *)location andImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _subject = subject;
        _location = location;
        _image = image;
    }
    return self;
}

@end
