//
//  FavoritosDetailViewController.h
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteSongs.h"
#import "Songs.h"


@interface FavoritosDetailViewController : UIViewController
@property (strong, nonatomic) FavoriteSongs *myFavoriteSongs;
@property (strong, nonatomic) Songs *latestsongs;
@property(strong, nonatomic) Songs *highlightsongs;
@property (strong, nonatomic) Songs *searchedsongs;


@end
