//
//  MRFArtist+MRFArtist_NSJSONSerialization.h
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRFArtist (MRFArtist_NSJSONSerialization)


//add an initializer to create the model object - DECODE
-(instancetype)initWithDictionary:(NSDictionary *)myDictionary;

//add a method that returns your model object as a NSDictionary - ENCODE ( to a dictionary )
- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
