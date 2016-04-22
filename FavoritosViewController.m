//
//  FavoritosViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "FavoritosViewController.h"
#import "FavoritosDetailViewController.h"
#import "AppDelegate.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FavoriteSongs.h"
#import "Songs.h"

@interface FavoritosViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewFavoritos;

@end

@implementation FavoritosViewController

{
    NSArray <FavoriteSongs *> *_allFavoriteSongs;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)showFavorites
{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    NSFetchRequest *requestFavorites = [NSFetchRequest fetchRequestWithEntityName:@"FavoriteSongs"];
    
    _allFavoriteSongs = [context executeFetchRequest:requestFavorites error:nil];
    
    [self.tableViewFavoritos reloadData];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _allFavoriteSongs.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell"];
    
    UILabel *labelTitle = [cell viewWithTag:1];
    UILabel *labelArtist = [cell viewWithTag:2];
    UILabel *labelDuration = [cell viewWithTag:3];
    UIImageView *albumPhoto = [cell viewWithTag:4];
    UIImageView *star = [cell viewWithTag:5];
    
    FavoriteSongs *f = _allFavoriteSongs[indexPath.row];
    
    labelTitle.text = [NSString stringWithFormat:@"%@", f.artist];
    labelArtist.text = [NSString stringWithFormat:@"%@", f.title];
    labelDuration.text = [NSString stringWithFormat:@"%@", f.duration];
    
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FavoriteSongs"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"artist=%@", f.artist];
    [request setPredicate:predicate];
    
    NSArray *check = [context executeFetchRequest:request error:nil];
    
    if (check.count == 0){
        star.image = [UIImage imageNamed:@"ic_star_outline_48pt"];
    } else {
        star.image = [UIImage imageNamed:@"ic_star_48pt"];
    }
    
    
    [albumPhoto sd_setImageWithURL:[NSURL URLWithString:f.thumbURL]];
    
    if (f.thumbURL == nil){
        
        NSString *albumPhotoPath = [delegate.applicationDocumentsDirectory.path stringByAppendingPathComponent:f.favorite];
        
        albumPhoto.image = [UIImage imageWithContentsOfFile:albumPhotoPath];
        
    }
    
    
    return cell;
    
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = delegate.managedObjectContext;
        
        [context deleteObject:_allFavoriteSongs[indexPath.row]];
        [delegate saveContext];
        
        
        [self showFavorites];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FavoriteSongs *f = _allFavoriteSongs[indexPath.row];
    
    [self performSegueWithIdentifier:@"FavoriteTableToDetail" sender:f];
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    FavoritosDetailViewController *fdvc = segue.destinationViewController;
    
    fdvc.myFavoriteSongs = sender;
}


@end
