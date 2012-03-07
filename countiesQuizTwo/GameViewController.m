//
//  GameViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"

#import "AppDelegate.h"

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize countiesTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];

	
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"random county: %i", randomCounty);
    
    
    NSArray * countiesArray = [NSArray arrayWithObjects:@"Devon",@"Cornwall",@"Yorkshire",@"London",@"Lancashire", nil];
    
    for (int y = 0; y < 5; y++) {
        NSLog(@"counties: %@" , [countiesArray objectAtIndex:y] );
    }
    
    
    NSString *countiesString = [countiesArray objectAtIndex:1];
    
    [countiesTextField setText:countiesString];
    
    countiesTextField.enabled = NO;
    
    NSLog(@"Game screen loaded");
}

- (void)viewDidUnload
{
    [self setCountiesTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView { 
    
	return 1; 
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component { 
	return 5; }

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component { 
    
    NSArray * countiesArray = [NSArray arrayWithObjects:@"Devon",@"Cornwall",@"Yorkshire",@"London",@"Lancashire", nil];
    
	return [countiesArray objectAtIndex:row]; 
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component { 
    
}

@end
