//
//  MRFArtist.m
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtist.h"

@implementation MRFArtist

- (instancetype)initWithArtistName:(NSString *)name bio:(NSString *)bio yearFormed:(double)yearFormed
{
    if (self = [super init])
    {
        _name = name;
        _bio = bio;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
