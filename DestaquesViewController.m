//
//  DestaquesViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "DestaquesViewController.h"
#import "DestaquesDetailViewController.h"
#import "FavoritosDetailViewController.h"
#import <AFNetworking.h>
#import "Songs.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AppDelegate.h"

@interface DestaquesViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewDestaques;

@end

@implementation DestaquesViewController

{
    NSArray<Songs *> *_topSongs;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gettopSongs];
}

- (void) gettopSongs {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"A obter os destaques..." message:nil preferredStyle:UIAlertControllerStyleAlert ];
    
    UIAlertAction *alertButtonActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alert addAction:alertButtonActionOK];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://reality6.com/musicservicejson.php?tipo=destaques"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             NSLog(@"download!!!!");
             NSLog(@"%@", responseObject);
             
             
             [self showTopSongsFetched:responseObject];
             
             [alert dismissViewControllerAnimated:YES completion:nil];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             
             NSLog(@"erro!!!!");
             NSLog(@"%@", error);
             
             [alert dismissViewControllerAnimated:YES completion:nil];
         }
     ];
}

- (void)showTopSongsFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *topSongs = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dTopSongs in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dTopSongs[@"id"];
        s.artist = dTopSongs[@"artist"];
        s.title = dTopSongs[@"title"];
        s.duration = dTopSongs[@"duration"];
        s.thumbURL = dTopSongs[@"thumb_url"];
        s.recent = dTopSongs[@"recent"];
        s.lyrics = dTopSongs[@"lyrics"];
        
        
        [topSongs addObject:s];
    }
    
    
    
    _topSongs = [NSArray arrayWithArray:topSongs];
    
    [self.tableViewDestaques reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _topSongs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell"];
    
    UILabel *labelTitle = [cell viewWithTag:1];
    UILabel *labelArtist = [cell viewWithTag:2];
    UILabel *labelDuration = [cell viewWithTag:3];
    UIImageView *albumPhoto = [cell viewWithTag:4];
    UIImageView *star = [cell viewWithTag:5];
    
    Songs *s = _topSongs[indexPath.row];
    
    labelTitle.text = [NSString stringWithFormat:@"%@", s.artist];
    labelArtist.text = [NSString stringWithFormat:@"%@", s.title];
    labelDuration.text = [NSString stringWithFormat:@"%@", s.duration];
    [albumPhoto sd_setImageWithURL:[NSURL URLWithString:s.thumbURL]];
    
    
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.managedObjectContext;
    NSFetchRequest *check = [NSFetchRequest fetchRequestWithEntityName:@"FavoriteSongs"];
    [check setPredicate:[NSPredicate predicateWithFormat:@"title = %@",_topSongs[indexPath.row].title]];
    NSArray *checkResults = [context executeFetchRequest:check error:nil];
    if (checkResults.count > 0) {
        [star setImage:[UIImage imageNamed:@"ic_star_48pt"]];
    } else {
        [star setImage:[UIImage imageNamed:@"ic_star_outline_48pt"]];
    }
    
    
    return cell;

}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Songs *s = _topSongs[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"DestaquesToDetalhes" sender:s];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

    DestaquesDetailViewController *ddvc = segue.destinationViewController;
    ddvc.highlightsongs = sender;
    
}

@end
