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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
    for(int i = 0; i<100; i++){
    
        int testInt = arc4random() % 5;
    
        NSLog(@"%i",testInt);
        
    }
    */
    
    
    
    /*
    NSNumber *numberA = [[NSNumber alloc] initWithInt:6];
    
    NSNumber *numberB = [[NSNumber alloc] initWithInt:9];
    
    NSNumber *numberC = [[NSNumber alloc] initWithInt:99];
    
    NSArray *myArray = [[NSArray alloc] initWithObjects:@"zero",@"one",@"two",@"three",nil];
    
    NSArray *numberArray = [[NSArray alloc] initWithObjects:numberA, numberB, nil];
    
    
    NSLog(@"%@",[myArray description]);
    
    
    if([numberArray containsObject:numberC]){
        NSLog(@"YES");
    } else{
        NSLog(@"NO");
    }
    */
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

@end
