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
    NSArray<Songs *> *_highlightSongs;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gethighlightSongs];
}

- (void) gethighlightSongs {
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
             
             
             [self showHighlightSongsFetched:responseObject];
             
             [alert dismissViewControllerAnimated:YES completion:nil];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             
             NSLog(@"erro!!!!");
             NSLog(@"%@", error);
             
             [alert dismissViewControllerAnimated:YES completion:nil];
         }
     ];
}

- (void)showHighlightSongsFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *highlightSongs = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dHighlightSongs in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dHighlightSongs[@"id"];
        s.artist = dHighlightSongs[@"artist"];
        s.title = dHighlightSongs[@"title"];
        s.duration = dHighlightSongs[@"duration"];
        s.thumbURL = dHighlightSongs[@"thumb_url"];
        s.recent = dHighlightSongs[@"recent"];
        
        
        [highlightSongs addObject:s];
    }
    
    
    
    _highlightSongs = [NSArray arrayWithArray:highlightSongs];
    
    [self.tableViewDestaques reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _highlightSongs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell"];
    
    UILabel *labelTitle = [cell viewWithTag:1];
    UILabel *labelArtist = [cell viewWithTag:2];
    UILabel *labelDuration = [cell viewWithTag:3];
    UILabel *labelImage = [cell.imageView viewWithTag:4];
    UILabel *labelStar = [cell.imageView viewWithTag:5];
    
    Songs *s = _highlightSongs[indexPath.row];
    
    
    
    
    labelTitle.text = [NSString stringWithFormat:@"%@", s.artist];
    labelArtist.text = [NSString stringWithFormat:@"%@", s.title];
    labelDuration.text = [NSString stringWithFormat:@"%@", s.duration];
    [cell.imageView setImageWithURL:[NSURL URLWithString:s.thumbURL]];
    [cell.imageView setImage:[UIImage imageNamed:@"star"]];
    
    return cell;
}


@end
