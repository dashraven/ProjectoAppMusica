//
//  ProcurarResultadosDetailViewController.h
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Songs;
@class FavoriteSongs;
@interface ProcurarResultadosDetailViewController : UIViewController
@property (strong, nonatomic) Songs *searchedsongs;
@property (strong, nonatomic) FavoriteSongs *myFavoriteSongs;
@end
