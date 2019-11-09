//
//  MRFArtistListTableViewController.h
//  ObjcFavArtist
//
//  Created by Michael Flowers on 11/9/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRFArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRFArtistListTableViewController : UITableViewController

@property (nonatomic) MRFArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
