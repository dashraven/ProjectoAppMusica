//
//  Songs+CoreDataProperties.h
//  ProjectoAppMusica
//
//  Created by dash on 12/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Songs.h"

NS_ASSUME_NONNULL_BEGIN

@interface Songs (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *artist;
@property (nullable, nonatomic, retain) NSString *duration;
@property (nullable, nonatomic, retain) NSNumber *favorites;
@property (nullable, nonatomic, retain) NSString *albumphoto;
@property (nullable, nonatomic, retain) NSString *lyricts;

@end

NS_ASSUME_NONNULL_END
