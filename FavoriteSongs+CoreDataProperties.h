//
//  FavoriteSongs+CoreDataProperties.h
//  ProjectoAppMusica
//
//  Created by dash on 21/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FavoriteSongs.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteSongs (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *artist;
@property (nullable, nonatomic, retain) NSString *lyrics;
@property (nullable, nonatomic, retain) NSString *duration;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *albumPhoto;
@property (nullable, nonatomic, retain) NSString *thumbURL;
@property (nullable, nonatomic, retain) NSString *favorite;

@end

NS_ASSUME_NONNULL_END
