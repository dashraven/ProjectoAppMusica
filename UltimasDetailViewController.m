//
//  UltimasDetailViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "UltimasDetailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface UltimasDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPhoto;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelArtist;
@property (weak, nonatomic) IBOutlet UILabel *labelDuration;
@property (weak, nonatomic) IBOutlet UIButton *labelFavoritos;

@end

@implementation UltimasDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSURL *photoURL = [NSURL URLWithString:s.photo.url];
//    
//    [self.imageViewPhoto sd_setImageWithURL:photoURL placeholderImage:placeholder];
//    
//    self.labelTitle.text = self.photo.title;
    
    
}



- (IBAction)clickedFavoritos:(id)sender {
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
