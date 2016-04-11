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
    [self performSegueWithIdentifier:@"MainToDestaques" sender:nil];
}

- (IBAction)clickedFavoritos:(id)sender {
    [self performSegueWithIdentifier:@"MainToFavoritos" sender:nil];
}


- (IBAction)clickedProcurar:(id)sender {
    [self performSegueWithIdentifier:@"MainToProcura" sender:nil];
}


@end
