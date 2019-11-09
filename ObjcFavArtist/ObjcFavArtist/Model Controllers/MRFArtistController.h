//
//  MRFArtistController.h
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRFArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRFArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray<MRFArtist *> *artists;
- (void)createArtistWithName:(NSString *)name
                         bio:(NSString *)bio
                  yearFormed:(double)yearFormed;

- (void)saveToPersistenceStore;
- (void)loadFromPersistenceStore;
@end

NS_ASSUME_NONNULL_END
