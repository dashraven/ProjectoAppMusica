//
//  ViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 04/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ViewController.h"
#import "UltimasViewController.h"
#import "DestaquesViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clickedUltimas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



#pragma marks navigation
- (IBAction)clickedUltimas:(id)sender {
    [self performSegueWithIdentifier:@"MainToUltimas" sender:nil];
}

- (IBAction)clickedDestaques:(id)sender {
    [self performSegueWithIdentifier:@"MainToTopTable" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if([[segue identifier] isEqualToString:@"MainToUltimas"]) {
        
        //get the controller that we are going to segue to
        UltimasViewController *uvc = segue.destinationViewController;
        uvc.latestSongs = sender;

    }
    
    if([[segue identifier] isEqualToString:@"MainToTopTable"]) {
        
        DestaquesViewController *dvc = segue.destinationViewController;
        dvc.highlightSongs = sender;
    }
}


@end
