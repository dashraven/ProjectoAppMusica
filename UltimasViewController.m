//
//  UltimasViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "UltimasViewController.h"
#import <AFNetworking.h>
#import "Songs.h"

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

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"A obter as mais recentes..." message:nil preferredStyle:UIAlertControllerStyleAlert];

    [self presentViewController:alert animated:YES completion:nil];


AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

[manager GET:@"http://reality6.com/musicservicejson.php?tipo=ultimas"
  parameters:nil
    progress:nil
     success:^(NSURLSessionDataTask *task, id responseObject) {
         
                      NSLog(@"download!!!!");
                      NSLog(@"%@", responseObject);
         
         
         [self showRecentSongsFetched:<#(NSArray *)#>:responseObject];
         
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
        s.songId = dSongs[@"id"];
        s.artist = dSongs[@"userId"];
        s.title = dSongs[@"title"];
        s.duration = dSongs[@"duration"];
        s.thumbURL = dSongs[@"thumbUrl"];
        
        
        [recentSongs addObject:p];
    }
    
    _recentsongs = [NSArray arrayWithArray:recentSongs];
    
    [self.tableViewUltimas reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
