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
@property (weak, nonatomic) IBOutlet UITableView *tableViewProcura;

@end

@implementation ProcurarResultadosViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return _allfoundSongs.length;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"protoCell"];
//    
//    UILabel *labelTitle = [cell viewWithTag:1];
//    UILabel *labelArtist = [cell viewWithTag:2];
//    UILabel *labelDuration = [cell viewWithTag:3];
//    UIImageView *Image = [cell.imageView viewWithTag:4];
//    UIImageView *Star = [cell.imageView viewWithTag:5];
//    
//    Songs *s = _allfoundSongs[indexPath.row];
//    
//    
//    
//    
//    labelTitle.text = [NSString stringWithFormat:@"%@", s.artist];
//    labelArtist.text = [NSString stringWithFormat:@"%@", s.title];
//    labelDuration.text = [NSString stringWithFormat:@"%@", s.duration];
//    [Image sd_setImageWithURL:[NSURL URLWithString:s.thumbURL]];
//    [Star setImage:[UIImage imageNamed:@"star"]];
//
//    return cell;
//}
//
//#pragma mark - UITableViewDelegate Methods
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    Songs *s = _topSongs[indexPath.row];
//
//}
@end
