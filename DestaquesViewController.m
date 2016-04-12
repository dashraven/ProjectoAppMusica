//
//  DestaquesViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "DestaquesViewController.h"
#import <AFNetworking.h>
#import "Songs.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

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
    UILabel *labelImage = [cell.imageView viewWithTag:4];
    UILabel *labelStar = [cell.imageView viewWithTag:5];
    
    Songs *s = _topSongs[indexPath.row];
    
    
    
    
    labelTitle.text = [NSString stringWithFormat:@"%@", s.artist];
    labelArtist.text = [NSString stringWithFormat:@"%@", s.title];
    labelDuration.text = [NSString stringWithFormat:@"%@", s.duration];
    [cell.imageView setImageWithURL:[NSURL URLWithString:s.thumbURL]];
    [cell.imageView setImage:[UIImage imageNamed:@"star"]];
    
    return cell;
}


@end
