//
//  FavoriteSongs.m
//  ProjectoAppMusica
//
//  Created by dash on 21/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "FavoriteSongs.h"
#import "AppDelegate.h"

@implementation FavoriteSongs

+ (instancetype)FavoriteSongsWithArtist:(NSString *)artist title:(NSString *)title duration:(NSString *)duration lyrics:(NSString *)lyrics albumPhoto:(NSString *)albumPhoto {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.managedObjectContext;
    FavoriteSongs *newFavoriteSongs = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteSong" inManagedObjectContext:context];
    
    newFavoriteSongs.artist = artist;
    newFavoriteSongs.title = title;
    newFavoriteSongs.duration = duration;
    newFavoriteSongs.lyrics = lyrics;
    newFavoriteSongs.albumPhoto = albumPhoto;
    return newFavoriteSongs;
}
@end


