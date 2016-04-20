//
//  ProcurarViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ProcurarViewController.h"
#import "ProcurarResultadosViewController.h"
#import "ProcurarResultadosViewController.m"
#import "Songs.h"
#import <AFNetworking/UIImageView+AFNetworking.h>


@interface ProcurarViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textProcurar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentSearch;

@end

@implementation ProcurarViewController

{
    NSArray<Songs *> *_allSongSearch;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


- (void)showAllSongTitlesFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *allSongSearch = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dAllSongSearch in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dAllSongSearch[@"id"];
        s.artist = dAllSongSearch[@"artist"];
        s.title = dAllSongSearch[@"title"];
        s.duration = dAllSongSearch[@"duration"];
        s.thumbURL = dAllSongSearch[@"thumb_url"];
        s.recent = dAllSongSearch[@"recent"];
        s.lyrics = dAllSongSearch[@"lyrics"];
        
        
        
        [allSongSearch addObject:s];
    }
    
    
    
    _allSongSearch = [NSArray arrayWithArray:allSongSearch];
    
}


- (void)showAllSongArtistsFetched:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *allSongSearch = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dAllSongSearch in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dAllSongSearch[@"id"];
        s.artist = dAllSongSearch[@"artist"];
        s.title = dAllSongSearch[@"title"];
        s.duration = dAllSongSearch[@"duration"];
        s.thumbURL = dAllSongSearch[@"thumb_url"];
        s.recent = dAllSongSearch[@"recent"];
        s.lyrics = dAllSongSearch[@"lyrics"];
        
        
        
        [allSongSearch addObject:s];
    }
    
    
    
    _allSongSearch = [NSArray arrayWithArray:allSongSearch];
    
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

    [self performSegueWithIdentifier:@"ProcuraToResultados" sender:_allSongSearch];
    
}




@end
