//
//  Photo.h
//  InstaKilo
//
//  Created by Graeme Harrison on 2016-01-27.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) UIImage *image;

-(instancetype)initWithSubject:(NSString*)subject location:(NSString*)location andImage:(UIImage*)image;

@end
