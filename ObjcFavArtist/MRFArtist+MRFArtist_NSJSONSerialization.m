//
//  MRFArtist+MRFArtist_NSJSONSerialization.m
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtist+MRFArtist_NSJSONSerialization.h"

//maybe import foundation>

@implementation MRFArtist (MRFArtist_NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)myDictionary {
    
    self = [super init];
    
    if (self){
        //check the string keys
            //initialize from dictionary, you have to 1. pull out the variables from the dictionary using json keys
        NSString *name = myDictionary[@"strArtist"];
       double yearFormed = [myDictionary[@"intYearReleased"] intValue];
        NSString *bio = myDictionary[@"strDescriptionEN"];
        
        //2.check that all variables are not nil
        if (name != nil && bio != nil){
            //3. create an artist - also handles all the copying in the property declaration
            self = [self initWithArtistName:name bio:bio yearFormed:yearFormed];
        } else {
            NSLog(@"Invalid Artist: %@ Json Object", name);
            self = nil;
        }
    }
    return self;
}

- (NSDictionary *)toDictionary{
    //take your model and turn it into a dictionary so that  you can use when you are saving to persistence store
    //We are returning a dictionary so we have to create one
    NSDictionary<NSString *, id> *result = @{
        //check the string keys
                             @"strArtist": self.name,
                             @"strDescriptionEN": self.bio,
                             /*
                              NSDictionary works with objects only and as a result, we cannot store primitives. We need to encapsulate primitive datatypes and make them into objects. Otherwise we will get an error
                              */
                             
                             @"intYearReleased": [NSNumber numberWithInt:self.yearFormed]
                             };
    return result;
}







@end
