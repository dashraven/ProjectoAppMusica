//
//  ProcurarResultadosDetailViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ProcurarResultadosDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Songs.h"

@interface ProcurarResultadosDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *albumPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *star;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelArtist;
@property (weak, nonatomic) IBOutlet UILabel *labelDuration;
@property (weak, nonatomic) IBOutlet UITextView *textLyrics;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *switchFavoritos;
@end

@implementation ProcurarResultadosDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *thumbURL = [NSURL URLWithString:self.searchedsongs.thumbURL];
    
    [self.albumPhoto sd_setImageWithURL:thumbURL];
    [self.star setImage:[UIImage imageNamed:@"star"]];
    
    
    
    self.labelTitle.text = self.searchedsongs.title;
    self.labelArtist.text = self.searchedsongs.artist;
    self.labelDuration.text = self.searchedsongs.duration;
    self.labelTitle.text = self.searchedsongs.title;
    self.textLyrics.text = self.searchedsongs.lyrics;
    
}

@end
