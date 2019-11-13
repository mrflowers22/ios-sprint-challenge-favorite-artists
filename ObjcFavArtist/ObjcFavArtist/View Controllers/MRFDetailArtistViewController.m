//
//  MRFDetailArtistViewController.m
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFDetailArtistViewController.h"
#import "MRFArtist.h"
#import "MRFArtistController.h"
#import "MRFNetworking.h"

@interface MRFDetailArtistViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;


@end

@implementation MRFDetailArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setArtist:(MRFArtist *)artist {
    if (artist != _artist){
        _artist = artist;
        NSLog(@"ARTIST WAS SET IN DETAILVC %@", _artist);
        [self updateViews];
    }
}


-(void)updateViews{
    //check to see if view has loaded
    if (!self.isViewLoaded || !self.artist){ return; }
    
    //grab information out of task
    self.title = self.artist.name;
    self.nameLabel.text = self.artist.name;
    NSString *yearFormedString = [[NSString alloc] initWithFormat:@"%i", self.artist.yearFormed];
    self.yearFormedLabel.text = yearFormedString;
    self.textView.text = self.artist.bio;
    
}


@end
