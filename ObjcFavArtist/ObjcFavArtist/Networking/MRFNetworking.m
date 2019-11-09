    //
    //  MRFNetworking.m
    //  ObjcFavArtist
    //
    //  Created by Michael Flowers on 11/9/19.
    //  Copyright © 2019 Michael Flowers. All rights reserved.
    //

#import "MRFNetworking.h"
#import "MRFArtist.h"
#import "MRFArtist+MRFArtist_NSJSONSerialization.h"

@implementation MRFNetworking

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/searchalbum.php";

 + (void)fetchArtistWithName:(NSString *)artistName completionBlock:(MRFArtistFetcherCompletionBlock)completionBlock
{
        //Construct URLComponents since we are going to query
    NSURLComponents *urlcomponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
        // ?s=coldplay
    NSArray *queryItemArray = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artistName]
    ];
        //add the queryItems to the urlComponents variable
    urlcomponents.queryItems = queryItemArray;
    
        //construct final url with urlComponents
    NSURL *url = urlcomponents.URL;
    
        //check url, slight error handling
    NSLog(@"This is the url: %@", url);
    
        //With a proper URL, create urlSessions
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            //check if made request
        NSLog(@"made request");
        
            // handle errors
        if (error){
            NSLog(@"This is the error: %@", error);
            completionBlock(nil, error);
            return;
        }
        
            //create jsonError
        NSError *jsonError = nil;
        
            //check data
        if (data)
        {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                //check jsonError
            if (jsonError){
                NSLog(@"JSONError: %@",jsonError);
                completionBlock(nil, jsonError);
                return;
            }
                //turn jsonDictionary into our model object
                //parse the json according to the api - inside the json (top level) dictionary there is a key named artist that is an array (of dicts)
            NSArray *artistArray = jsonDict[@"album"];
            
                //loop through the array of dicts to get the values (we set in the category for our model)
            for (NSDictionary *dict in artistArray)
            {
                    //convert into model object
                MRFArtist *artist = [[MRFArtist alloc] initWithDictionary:dict]; //now we have an artist
                
                    //check value of artist, if so then complete
                if (artist){
                    NSLog(@"artist name: %@", artist.name);
                    completionBlock(artist, nil);
                }
            }
        } else {
            NSLog(@"Error with data in fetch function");
            completionBlock(nil, error);
        }
    }];
    [task resume];
    
}

@end
