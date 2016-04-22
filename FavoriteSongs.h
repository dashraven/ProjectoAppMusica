//
//  FavoriteSongs.h
//  ProjectoAppMusica
//
//  Created by dash on 21/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


NS_ASSUME_NONNULL_BEGIN

@interface FavoriteSongs : NSManagedObject

+ (instancetype)FavoriteSongsWithArtist:(NSString *)artist title:(NSString *)title duration:(NSString *)duration lyrics:(NSString *)lyrics albumPhoto:(NSString *)albumPhoto;

@end

NS_ASSUME_NONNULL_END

#import "FavoriteSongs+CoreDataProperties.h"



