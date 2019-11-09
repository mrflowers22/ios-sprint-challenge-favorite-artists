//
//  MRFNetworking.h
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRFArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^MRFArtistFetcherCompletionBlock)(MRFArtist *, NSError *);

@interface MRFNetworking : NSObject

-(void)fetchArtistWithName:(NSString *)artistName
completionBlock:(MRFArtistFetcherCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
