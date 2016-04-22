//
//  ProcurarResultadosViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ProcurarResultadosViewController.h"
#import "ProcurarResultadosDetailViewController.h"
#import "AFNetworking/AFNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Songs.h"

@interface ProcurarResultadosViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewProcura;

@end

@implementation ProcurarResultadosViewController

{
    NSArray<Songs *> *_foundSongs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self jsonGetSearch]; 
}

- (void)jsonGetSearch {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"A pesquisar..." message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:NO completion:nil];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:_allfoundSongs
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             
             NSLog(@"download!!!!");
             NSLog(@"%@", responseObject);
             
             [self showJsonSearchResults:responseObject];
             
             [alert dismissViewControllerAnimated:YES completion:nil];
             
         }
     
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             [alert dismissViewControllerAnimated:YES completion:nil];
         }
     ];
}
- (void)showJsonSearchResults:(NSArray *)fetched {
    
    NSLog(@"%@", fetched);
    
    NSMutableArray<Songs *> *foundSongs = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dFoundSongs in fetched) {
        
        Songs *s = [[Songs alloc] init];
        s.songId = dFoundSongs[@"id"];
        s.artist = dFoundSongs[@"artist"];
        s.title = dFoundSongs[@"title"];
        s.duration = dFoundSongs[@"duration"];
        s.thumbURL = dFoundSongs[@"thumb_url"];
        s.recent = dFoundSongs[@"recent"];
        s.lyrics = dFoundSongs[@"lyrics"];
        
        
        [foundSongs addObject:s];
    }
    
    
    
    _foundSongs = [NSArray arrayWithArray:foundSongs];
    
    [self.tableViewProcura reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _foundSongs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell"];
    
        
    UILabel *labelTitle = [cell viewWithTag:1];
    UILabel *labelArtist = [cell viewWithTag:2];
    UILabel *labelDuration = [cell viewWithTag:3];
    UIImageView *albumPhoto = [cell.imageView viewWithTag:4];
    UIImageView *star = [cell.imageView viewWithTag:5];
    
    Songs *s = _foundSongs[indexPath.row];

    
    labelTitle.text = [NSString stringWithFormat:@"%@", s.artist];
    labelArtist.text = [NSString stringWithFormat:@"%@", s.title];
    labelDuration.text = [NSString stringWithFormat:@"%@", s.duration];
    [albumPhoto sd_setImageWithURL:[NSURL URLWithString:s.thumbURL]];
    [star setImage:[UIImage imageNamed:@"star"]];

    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Songs *s = _foundSongs[indexPath.row];

    [self performSegueWithIdentifier:@"ProcuraResultadosToFavoritosDetalhes" sender:s];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ProcurarResultadosDetailViewController *prdvc = segue.destinationViewController;
    prdvc.searchedsongs = sender;
    
}

@end
