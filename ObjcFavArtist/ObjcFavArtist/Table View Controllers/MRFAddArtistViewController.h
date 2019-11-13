//
//  MRFAddArtistViewController.h
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRFArtist.h"
#import "MRFArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRFAddArtistViewController : UIViewController
@property (nonatomic) MRFArtistController *artistController;
@property (nonatomic) MRFArtist *artist;
@end

NS_ASSUME_NONNULL_END
