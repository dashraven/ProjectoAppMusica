//
//  Songs.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "Songs.h"
#import "AppDelegate.h"

@implementation Songs

- (instancetype) initWithSongId:(NSNumber *)songId artist:(NSString *)artist title:(NSString *)title duration:(NSString *)duration thumbURL:(NSString *)thumbURL lyrics:(NSString *)lyrics highlight:(NSNumber *)highlight recent:(NSNumber *)recent {
    self = [super init];
    if (self) {
        self.songId = songId;
        self.artist = artist;
        self.title = title;
        self.duration = duration;
        self.thumbURL = thumbURL;
        self.lyrics = lyrics;
        self.highlight = highlight;
        self.recent = recent;
    }
    return self;

}

+ (instancetype) songWithSongId:(NSNumber *)songId artist:(NSString *)artist title:(NSString *)title duration:(NSString *)duration thumbURL:(NSString *)thumbURL lyrics:(NSString *)lyrics highlight:(NSNumber *)highlight recent:(NSNumber *)recent {
    return [[Songs alloc] initWithSongId:songId artist:artist title:title duration:duration thumbURL:thumbURL lyrics:lyrics highlight:highlight recent:recent];
    
}

+ (instancetype)newFavoriteSong
{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    Songs *f = [NSEntityDescription insertNewObjectForEntityForName:@"Songs" inManagedObjectContext:context];
    
    return f;
}




@end
