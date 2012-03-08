//
//  AnswerViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()


@end

@implementation AnswerViewController

@synthesize countySelected;

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
    
    NSArray * countiesArray = [NSArray arrayWithObjects:@"Devon",@"Cornwall",@"Yorkshire",@"London",@"Lancashire", nil];
    
    for (int y = 0; y < 5; y++) {
        NSLog(@"counties: %@" , [countiesArray objectAtIndex:y] );
    }
    
    
    
    //((CountyNavController *)self.parentViewController).testProp = 12345;
    

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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView { 
    
	return 1; 
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component { 
	return 5; 
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component { 
    
    NSArray * countiesArray = [NSArray arrayWithObjects:@"Devon",@"Cornwall",@"Yorkshire",@"London",@"Lancashire", nil];
    
	return [countiesArray objectAtIndex:row]; 
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component { 
    
    self.countySelected = row;
    
    NSLog(@"row selected:%i", row);
    
    NSLog(@"county selected");
    
}

- (IBAction)didFinishSelectingAnswer:(id)sender {
    
    //>>>NSLog(@"finished selecting %i", self.countySelected);
    
    //
    
    //NSLog(@"zzz testvar %i", GameViewController.testVar);
    
    //[GameViewController isAnswerCorrect];
    
    //[self.parentViewController isAnswerCorrect:self.countySelected];
    
    
    NSLog(@">>>>>>>>>>>>>>>>>> description %i",((CountyNavController *)self.presentingViewController).currentCountyToGuess);
    
    ((CountyNavController *)self.presentingViewController).currentCountyAnswer = self.countySelected;
    
    //NSLog(@">>>>>>>>>>>>>>>>>> description %i",((GameViewController *)self.presentingViewController).testVar);
    
    [self dismissModalViewControllerAnimated:YES];
    
    //GameViewController *gameInstance = [[GameViewController alloc] init];
    
    //[gameInstance isAnswerCorrect:self.countySelected];
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear: animated];
                     
    
    int currentCounty = ((CountyNavController *)self.presentingViewController).currentCountyToGuess;
    
    GameViewController *gameInstance = [[GameViewController alloc] init];
    
    [gameInstance isAnswerCorrect:self.countySelected currentHighlightedCounty:currentCounty];
    
    //[self.parentViewController isAnswerCorrect:self.countySelected];    
    
}


@end
