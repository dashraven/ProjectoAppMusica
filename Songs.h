//
//  Songs.h
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Songs : NSObject

@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *duration;
@property (strong, nonatomic) NSString *thumbURL;
@property (strong, nonatomic) NSString *lyrics;
@property (strong, nonatomic) NSNumber *highlight;
@property (strong, nonatomic) NSNumber *recent;
@property (strong,nonatomic) NSNumber  *songId;

- (instancetype) initWithSongId:(NSNumber *)songId artist:(NSString *)artist title:(NSString *)title duration:(NSString *)duration thumbURL:(NSString *)thumbURL lyrics:(NSString *)lyrics highlight:(NSNumber *)highlight recent:(NSNumber *)recent;

+ (instancetype) songWithSongId:(NSNumber *)songId artist:(NSString *)artist title:(NSString *)title duration:(NSString *)duration thumbURL:(NSString *)thumbURL lyrics:(NSString *)lyrics highlight:(NSNumber *)highlight recent:(NSNumber *)recent;

@end
