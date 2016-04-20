//
//  DestaquesDetailViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "DestaquesDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Songs.h"

@interface DestaquesDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *albumPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *star;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelArtist;
@property (weak, nonatomic) IBOutlet UILabel *labelDuration;
@property (weak, nonatomic) IBOutlet UITextView *textLyrics;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *switchFavoritos;


@end

@implementation DestaquesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *thumbURL = [NSURL URLWithString:self.highlightsongs.thumbURL];
    
    [self.albumPhoto sd_setImageWithURL:thumbURL];
    [self.star setImage:[UIImage imageNamed:@"star"]];
    
    
    
    self.labelTitle.text = self.highlightsongs.title;
    self.labelArtist.text = self.highlightsongs.artist;
    self.labelDuration.text = self.highlightsongs.duration;
    self.labelTitle.text = self.highlightsongs.title;
    self.textLyrics.text = self.highlightsongs.lyrics;
    
}



//- (IBAction)clickedFavoritos:(id)sender {
//
//}

@end
