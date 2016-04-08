//
//  ViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 04/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ViewController.h"
#import "UltimasViewController.h"

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
UltimasViewController *uvc = segue.destinationViewController;
uvc.latestSongs = sender;
    
}


@end
