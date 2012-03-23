//
//  ViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 03/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()




@end



@implementation ViewController

@synthesize isQuickGame;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   }



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)playFullGame:(id)sender {
    
    [self setIsQuickGame:@"NO"];
    
    [self performSegueWithIdentifier:@"toGame" sender:self];
    
    
}

- (IBAction)playQuickGame:(id)sender {
    
    [self setIsQuickGame:@"YES"];

    [self performSegueWithIdentifier:@"toGame" sender:self];

}
@end
