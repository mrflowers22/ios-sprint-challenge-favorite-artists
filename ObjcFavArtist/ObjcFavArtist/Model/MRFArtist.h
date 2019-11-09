    //
    //  MRFArtist.h
    //  ObjcFavArtist
    //
    //  Created by Michael Flowers on 11/9/19.
    //  Copyright © 2019 Michael Flowers. All rights reserved.
    //

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRFArtist : NSObject

@property (nonatomic, readonly, copy)NSString *name;
@property (nonatomic, readonly, copy) NSString *bio;
@property (nonatomic, readonly) int yearFormed;

- (instancetype)initWithArtistName:(NSString *)name
                               bio:(NSString *)bio
                        yearFormed:(int)yearFormed;

@end

NS_ASSUME_NONNULL_END
