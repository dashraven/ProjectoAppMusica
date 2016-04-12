//
//  ProcurarResultadosViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ProcurarResultadosViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "Songs.h"

@interface ProcurarResultadosViewController ()

@end

@implementation ProcurarResultadosViewController


{
    NSArray<Songs *> *_allSongs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self allSongs];
}

- (void) getallSongs {
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"A obter as mais recentes..." message:nil preferredStyle:UIAlertControllerStyleAlert ];
//    
//    UIAlertAction *alertButtonActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        
//    }];
//    [alert addAction:alertButtonActionOK];
//    
//    [self presentViewController:alert animated:YES completion:nil];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://reality6.com/musicservicejson.php?"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             NSLog(@"download!!!!");
             NSLog(@"%@", responseObject);
             
             
             [self showAllSongsFetched:responseObject];
             
             
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             
             NSLog(@"erro!!!!");
             NSLog(@"%@", error);
             
             
         }
     ];
}

- (void)showAllSongsFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *allSongs = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dAllSongs in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dAllSongs[@"id"];
        s.artist = dAllSongs[@"artist"];
        s.title = dAllSongs[@"title"];
        s.duration = dAllSongs[@"duration"];
        s.thumbURL = dAllSongs[@"thumb_url"];
        s.recent = dAllSongs[@"recent"];
        s.lyrics = dAllSongs[@"lyrics"];
        
        
        
        [recentSongs addObject:s];
    }
    
    
    
    _recentSongs = [NSArray arrayWithArray:recentSongs];
    
    [self.tableViewUltimas reloadData];
}




@end
