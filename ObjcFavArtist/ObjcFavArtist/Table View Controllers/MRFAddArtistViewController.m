//
//  MRFAddArtistViewController.m
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFAddArtistViewController.h"
#import "MRFArtist.h"
#import "MRFArtistController.h"
#import "MRFNetworking.h"

@interface MRFAddArtistViewController ()


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MRFAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    
    
    
    BOOL isNewArtist = self.artist == nil;
        MRFArtist *artist = isNewArtist ? [[MRFArtist alloc]init] : self.artist;
        
        // TODO SAVE ARTIST
   
    [self.artistController createArtistWithName: artist.name bio: artist.bio yearFormed: artist.yearFormed];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchbar buttonclicked");
    //TODO - MAKE NETWORK CALL HERE
    NSString *name = searchBar.text;

    [MRFNetworking fetchArtistWithName:name completionBlock:^(MRFArtist *artist, NSError *error)
     {
        if (error){
            NSLog(@"Error fetching while saving:%@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(),^ {
            self.title = self.artist.name;
            self.nameLabel.text = artist.name;
            NSString *yearFormedString = [[NSString alloc] initWithFormat:@"%i", artist.yearFormed];
            self.yearFormedLabel.text = yearFormedString;
            self.bioTextView.text = artist.bio;
            self.searchBar.hidden = YES;
            self.view.backgroundColor = [UIColor blueColor];
            self.artist = artist;
        });
    }];
}

@end
