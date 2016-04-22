//
//  FavoritosDetailViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "FavoritosDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Songs.h"
#import "FavoriteSongs.h"
#import "AppDelegate.h"


@interface FavoritosDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *albumPhoto;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelArtist;
@property (weak, nonatomic) IBOutlet UILabel *labelDuration;
@property (weak, nonatomic) IBOutlet UITextView *textLyrics;
@property (weak, nonatomic) IBOutlet UIButton *addFav;


@end

@implementation FavoritosDetailViewController
{

    NSArray *fetchResult;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.addFav setBackgroundImage:[UIImage imageNamed:@"ic_star_48pt.png"] forState:UIControlStateNormal];
    
  
    
    self.labelTitle.text = self.myFavoriteSongs.title;
    self.labelArtist.text = self.myFavoriteSongs.artist;
    self.labelDuration.text = self.myFavoriteSongs.duration;
    self.labelTitle.text = self.myFavoriteSongs.title;
    self.textLyrics.text = self.myFavoriteSongs.lyrics;
    
}

- (IBAction)clickedStar:(id)sender {
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FavoriteSongs"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"title = %@", self.myFavoriteSongs.title]];
    fetchResult= [context executeFetchRequest:request error:nil];
    if (fetchResult.count > 0) {
        [[NSFileManager defaultManager] removeItemAtPath:[delegate.applicationDocumentsDirectory.path stringByAppendingPathComponent: self.myFavoriteSongs.albumPhoto] error:nil];
        [context deleteObject:fetchResult[0]];
    } else {
        UIImage *albumPhoto = self.albumPhoto.image;
        NSData *albumPhotoData = UIImagePNGRepresentation(albumPhoto);
        NSMutableString *albumPhotoFile = [[NSMutableString alloc] initWithString:self.myFavoriteSongs.title];
        [albumPhotoFile appendString:@".png"];
        for (int i = 0; i < albumPhotoFile.length; i++) {
            NSRange posicao = NSMakeRange(i, 1);
            char letra = [albumPhotoFile characterAtIndex:i];
            if (letra == ' ') {
                [albumPhotoFile replaceCharactersInRange:posicao withString:@""];
            }
        }
        NSMutableString *albumPhotoPath = [[NSMutableString alloc] initWithString:[delegate.applicationDocumentsDirectory.path stringByAppendingPathComponent:albumPhotoFile]];
        [albumPhotoData writeToFile:albumPhotoPath atomically:YES];
        [FavoriteSongs FavoriteSongsWithArtist:self.myFavoriteSongs.artist title:self.myFavoriteSongs.title duration:self.myFavoriteSongs.duration lyrics:self.myFavoriteSongs.title albumPhoto:albumPhotoFile];
    }
    [delegate saveContext];
    [self.navigationController popViewControllerAnimated:YES];
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
