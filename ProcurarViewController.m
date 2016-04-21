//
//  ProcurarViewController.m
//  ProjectoAppMusica
//
//  Created by Formando Web Mobile on 06/04/16.
//  Copyright © 2016 Formando Web Mobile. All rights reserved.
//

#import "ProcurarViewController.h"
#import "ProcurarResultadosViewController.h"
#import "Songs.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface ProcurarViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textProcurar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentSearch;

@end

@implementation ProcurarViewController

{
    NSArray<Songs *> *_allSongSearch;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


- (IBAction)clickedBusca:(id)sender {
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    NSMutableString *_json = [[NSMutableString alloc] initWithString:@"http://reality6.com/musicservicejson.php?tipo="];
    
   
    if (selectedSegment == 0) {
        [_json appendString:@"buscaartista&nome="];
    } else {
        [_json appendString:@"buscacancao&nome="];
    }
    
    [_json appendString:_textProcurar.text];
    

    for (int i = 0; i < _json.length; i++) {
        NSRange posicao = NSMakeRange(i, 1);
        char letra = [_json characterAtIndex:i];
        if (letra == ' ') {
            [_json replaceCharactersInRange:posicao withString:@"+"];
        }
    }
    
     [self performSegueWithIdentifier:@"ProcuraToResultados" sender:_json];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    ProcurarResultadosViewController *prvc = segue.destinationViewController;
    prvc.allfoundSongs = sender;
    
}



@end
