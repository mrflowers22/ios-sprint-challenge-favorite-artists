//
//  MRFArtistController.m
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtistController.h"
#import "MRFArtist.h"
#import  "MRFArtist+MRFArtist_NSJSONSerialization.h"

@interface MRFArtistController ()

@property (nonatomic) NSMutableArray<MRFArtist *> *internalArtists;

@end

@implementation MRFArtistController

//have to init private property  if its an object

- (instancetype)init
{
    if (self = [super init])
    {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

//create a computed property for your array
- (NSArray<MRFArtist *> *)artists
{
    return self.internalArtists.copy;
}

//Create a computed property that returns a URL for saving
+ (NSURL *)persistentStoreFileURL {
    NSArray<NSURL *> *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                    inDomains:NSUserDomainMask];
    return [urls[0] URLByAppendingPathComponent:@"favoriteArtist.json"];
}

- (void)createArtistWithName:(NSString *)name bio:(NSString *)bio yearFormed:(double)yearFormed
{
    MRFArtist *artist = [[MRFArtist alloc] initWithArtistName:name bio:bio yearFormed:yearFormed];
    NSLog(@"Do we have an artist? Yes, artist yearFormed property: %i", artist.yearFormed);
    NSLog(@"_internalArtists array count: %lu", self.internalArtists.count);
    NSLog(@"Artists array count: %lu", self.artists.count);
    [self saveToPersistenceStore];
}



- (void)saveToPersistenceStore {
    //Turn an artist into a dictionary
    //loop through our internal Array, grab an artist, init a dict from that
    //create an mutable array of dictionaries (from all the artists we converted to dicts)
    NSMutableArray<NSDictionary *> *artistsToSave =  [[NSMutableArray alloc] init];
    
    for (MRFArtist *artist in _internalArtists)
    {
        if (artist)
        {
            NSDictionary *dictionaryFromArtist =  [artist toDictionary];
            //add new artDict to the mutableArray of Dicts
            [artistsToSave addObject: dictionaryFromArtist];
        }
        
    }
    //save dictionary to persistentFileURL
    NSError *jsonError = nil;
    
    //serialize the array of dictionaries ( to turn them into data for saving )
    NSData *jsonData =  [NSJSONSerialization dataWithJSONObject:artistsToSave options:0 error:&jsonError];
    
    //check error
    if (jsonError)
    {
        NSLog(@"Unable to convert artists to JSON: %@", jsonError);
        return;
    }
    
    //no errors then we can save the data and write it to the fileURL
    [jsonData writeToURL: [MRFArtistController persistentStoreFileURL] atomically:YES];
}


- (void)loadFromPersistenceStore
{
    //go to the fileURL and get data from file
    NSError *dataError = nil;
    NSData *data = [NSData dataWithContentsOfURL:[MRFArtistController persistentStoreFileURL] options:0 error: &dataError];
    
    if (dataError){
        NSLog(@"Error corrupt data from our persistenceStoreFile: %@", dataError);
    }
    //create holding array from the model objects we expect to get back from the file
    NSMutableArray<MRFArtist*> *tempArtistArray =  [[NSMutableArray alloc] init];
    
    NSError *jsonError = nil;
    //check value of data
    if (data)
    {
        //turn that data into our model object - we will get an array of dictionaries
        NSArray *artistInDictionaryForm = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        for (NSDictionary *artist in artistInDictionaryForm)
        {
            //create your model object from the dictionary initializer
            MRFArtist *artistFromDictionary = [[MRFArtist alloc] initWithDictionary:artist];
            
            if (artistFromDictionary)
            {
                [tempArtistArray addObject:artistFromDictionary];
            }
        }
        
        //put the arrays in our internal artist array
        _internalArtists = tempArtistArray;
    }
}


@end
