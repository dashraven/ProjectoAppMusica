//
//  UltimasDetailViewController.h
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Songs;
@class FavoriteSongs;

@interface UltimasDetailViewController : UIViewController

@property(strong, nonatomic) Songs *latestsongs;
@property (strong, nonatomic) FavoriteSongs *myFavoriteSongs;

@end
