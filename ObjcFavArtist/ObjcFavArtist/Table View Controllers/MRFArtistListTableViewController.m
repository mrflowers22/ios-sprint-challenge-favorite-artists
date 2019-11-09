    //
    //  MRFArtistListTableViewController.m
    //  ObjcFavArtist
    //
    //  Created by Michael Flowers on 11/9/19.
    //  Copyright © 2019 Michael Flowers. All rights reserved.
    //

#import "MRFArtistListTableViewController.h"
#import "MRFArtistController.h"
#import "MRFArtist.h"
#import "MRFDetailArtistViewController.h"

@interface MRFArtistListTableViewController ()

@end

@implementation MRFArtistListTableViewController

    //initialize the artistController as a lazy property
- (MRFArtistController *)artistController {
    if (_artistController == nil){
        _artistController = [[MRFArtistController alloc] init];
    }
    return _artistController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadFromPersistenceStore];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    MRFArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    
    return cell;
}

    //// Override to support editing the table view.
    //- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    if (editingStyle == UITableViewCellEditingStyleDelete) {
    //
    ////        MRFArtist *artistToDelete = [self.artistController.artists objectAtIndex:indexPath.row];
    //
    //        // Delete the row from the data source
    //        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    //        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //    }
    //}

#pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"cellSegue"])
    {
        MRFDetailArtistViewController * detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        MRFArtist *artistToPass = [self.artistController.artists objectAtIndex:indexPath.row];
        
        detailVC.artist = artistToPass;
        detailVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"addSegue"])
    {
         MRFDetailArtistViewController * detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
}
                
                
@end
