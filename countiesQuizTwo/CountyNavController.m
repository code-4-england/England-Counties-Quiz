//
//  CountyNavController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 08/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CountyNavController.h"

@interface CountyNavController ()


@end

@implementation CountyNavController

@synthesize testProp;
@synthesize currentCountyToGuess;
@synthesize score;
@synthesize currentCountyAnswer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.testProp = 888;
    
    self.currentCountyToGuess = 10000;
    
    NSLog(@"testProp1 %i", self.testProp);
    
    NSLog(@"currentCountyToGuess initial %i", self.currentCountyToGuess);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
