//
//  ProcurarViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ProcurarViewController.h"
#import "ProcurarResultadosViewController.h"
#import <AFNetworking.h>
#import "Songs.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ProcurarViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textProcurar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentSearch;

@end

@implementation ProcurarViewController

{
    NSArray<Songs *> *_allSongTitles;
    NSArray<Songs *> *_allSongArtists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)showAllSongTitlesFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *allSongTitles = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dAllSongTitles in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dAllSongTitles[@"id"];
        s.artist = dAllSongTitles[@"artist"];
        s.title = dAllSongTitles[@"title"];
        s.duration = dAllSongTitles[@"duration"];
        s.thumbURL = dAllSongTitles[@"thumb_url"];
        s.recent = dAllSongTitles[@"recent"];
        s.lyrics = dAllSongTitles[@"lyrics"];
        
        
        
        [allSongTitles addObject:s];
    }
    
    
    
    _allSongTitles = [NSArray arrayWithArray:allSongTitles];
    
}


- (void)showAllSongArtistsFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *allSongArtists = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dAllSongArtists in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dAllSongArtists[@"id"];
        s.artist = dAllSongArtists[@"artist"];
        s.title = dAllSongArtists[@"title"];
        s.duration = dAllSongArtists[@"duration"];
        s.thumbURL = dAllSongArtists[@"thumb_url"];
        s.recent = dAllSongArtists[@"recent"];
        s.lyrics = dAllSongArtists[@"lyrics"];
        
        
        
        [allSongArtists addObject:s];
    }
    
    
    
    _allSongArtists = [NSArray arrayWithArray:allSongArtists];
    
}



- (IBAction)clickedSegment:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    
    if (selectedSegment == 0) {
        
        Songs *a = [[Songs alloc] init];
        a.artist = self.textProcurar.text;
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        NSString *url = [NSString stringWithFormat:@"http://reality6.com/musicservicejson.php?tipo=buscacancao&nome=%@", self.textProcurar.text];

        NSDictionary *params = @{
                                 @"tipo": @"buscacancao",
                                 @"nome": self.textProcurar.text
                                 };
        
        [manager GET:@"http://reality6.com/musicservicejson.php"
          parameters:params
            progress:nil
             success:^(NSURLSessionDataTask *task, id responseObject) {
                 
                 NSLog(@"download!!!!");
                 NSLog(@"%@", responseObject);
                
                 
                 [self showAllSongTitlesFetched:responseObject];
                 
             }
             failure:^(NSURLSessionDataTask *task, NSError *error) {
                 
                 NSLog(@"erro!!!!");
                 NSLog(@"%@", error);
                 
             }
         ];
        
    } else {
        
        Songs *t = [[Songs alloc] init];
        t.title = self.textProcurar.text;
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //NSString *url = [NSString stringWithFormat:@"http://reality6.com/musicservicejson.php?tipo=buscaartista&nome=%@", self.textProcurar.text];
        
        NSDictionary *params = @{
                                 @"tipo": @"buscaartista",
                                 @"nome": self.textProcurar.text
                                 };
        
        [manager GET:@"http://reality6.com/musicservicejson.php"
          parameters:params
            progress:nil
             success:^(NSURLSessionDataTask *task, id responseObject) {
                 
                 NSLog(@"download!!!!");
                 NSLog(@"%@", responseObject);
                 
                 
                 [self showAllSongArtistsFetched:responseObject];
                 
             }
         
             failure:^(NSURLSessionDataTask *task, NSError *error) {
                 
                 NSLog(@"erro!!!!");
                 NSLog(@"%@", error);
             }
         ];
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    ProcurarResultadosViewController *prvc = segue.destinationViewController;
    prvc.allfoundSongs = sender;

}

- (IBAction)clickedBusca:(id)sender {

    NSInteger selectedSegment = self.segmentSearch.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        
    [self performSegueWithIdentifier:@"ProcuraToResultados" sender:_allSongTitles];
        
    } else {
        
    }[self performSegueWithIdentifier:@"ProcuraToResultados" sender:_allSongArtists];
    
}




@end
