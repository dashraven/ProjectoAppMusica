//
//  UltimasViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "UltimasViewController.h"
#import "UltimasDetailViewController.h"
#import <AFNetworking.h>
#import "Songs.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface UltimasViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewUltimas;

@end

@implementation UltimasViewController

{
    NSArray<Songs *> *_recentSongs;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getrecentSongs];
}

- (void) getrecentSongs {
   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"A obter as mais recentes..." message:nil preferredStyle:UIAlertControllerStyleAlert ];
    
       UIAlertAction *alertButtonActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    
       }];
        [alert addAction:alertButtonActionOK];

    [self presentViewController:alert animated:YES completion:nil];


AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

[manager GET:@"http://reality6.com/musicservicejson.php?tipo=ultimas"
  parameters:nil
    progress:nil
     success:^(NSURLSessionDataTask *task, id responseObject) {
         
                      NSLog(@"download!!!!");
                      NSLog(@"%@", responseObject);
         
         
         [self showRecentSongsFetched:responseObject];
         
         [alert dismissViewControllerAnimated:YES completion:nil];
     }
     failure:^(NSURLSessionDataTask *task, NSError *error) {
         
         NSLog(@"erro!!!!");
         NSLog(@"%@", error);
         
         [alert dismissViewControllerAnimated:YES completion:nil];
     }
 ];
}

- (void)showRecentSongsFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *recentSongs = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dRecentSongs in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dRecentSongs[@"id"];
        s.artist = dRecentSongs[@"artist"];
        s.title = dRecentSongs[@"title"];
        s.duration = dRecentSongs[@"duration"];
        s.thumbURL = dRecentSongs[@"thumb_url"];
        s.recent = dRecentSongs[@"recent"];
        s.lyrics = dRecentSongs[@"lyrics"];
        
        
       
        [recentSongs addObject:s];
    }
    
    
    
    _recentSongs = [NSArray arrayWithArray:recentSongs];
    
    [self.tableViewUltimas reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _recentSongs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell"];
    
    UILabel *labelTitle = [cell viewWithTag:1];
    UILabel *labelArtist = [cell viewWithTag:2];
    UILabel *labelDuration = [cell viewWithTag:3];
    UIImageView *albumPhoto = [cell viewWithTag:4];
    UIImageView *star = [cell viewWithTag:5];
    
    Songs *s = _recentSongs[indexPath.row];
    

    
    
    labelTitle.text = [NSString stringWithFormat:@"%@", s.artist];
    labelArtist.text = [NSString stringWithFormat:@"%@", s.title];
    labelDuration.text = [NSString stringWithFormat:@"%@", s.duration];
    [albumPhoto sd_setImageWithURL:[NSURL URLWithString:s.thumbURL]];
    [star setImage:[UIImage imageNamed:@"star"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Songs *s = _recentSongs[indexPath.row];
    
    [self performSegueWithIdentifier:@"UltimasToFavoritosDetalhes" sender:s];
    
    //[self performSegueWithIdentifier:@"UltimasToUltimasDetalhes" sender:s];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    UltimasDetailViewController *udvc = segue.destinationViewController;
    udvc.latestsongs = sender;
    
}

@end
