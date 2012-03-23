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
    
   // NSLog(@"test test test>>>> %i", ((GameViewController *)self.presentingViewController).score);
    self.countySelected = 0;
    
    ((GameViewController *)self.presentingViewController).currentAnswer = 0;
    
     //NSLog(@"county selected: 0");
    
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
	return 47; 
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component { 
    
    //NSArray * countiesArray = [NSArray arrayWithObjects:@"Devon",@"Cornwall",@"Yorkshire",@"London",@"Lancashire", nil];
    
    //NOTE: I've missed out city of London - don't think this is really county.
    
    
    // PUT IN Game Controller ************************************
    
                                
    NSArray *pickerArray = ((GameViewController *)self.presentingViewController).countyNameArray;
    
	return [pickerArray objectAtIndex:row]; 
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component { 
    
    self.countySelected = row;
    
    ((GameViewController *)self.presentingViewController).currentAnswer = row;
    
    //NSLog(@"row selected:%i", row);
    
    //NSLog(@"county selected");
    
}



- (IBAction)doneAnswering:(id)sender {
    
    
    GameViewController * gameController = ((GameViewController *)self.presentingViewController);
    
    
    //gameController.hideGame.hidden = NO;
    
    [gameController gotoResults]; 
    
    //[self dismissModalViewControllerAnimated:YES];
    
}

- (void)closeAnswerView {
    
    
    [self dismissModalViewControllerAnimated:YES];
        
    
}

- (IBAction)backToMap:(id)sender {
    
    
    [self dismissModalViewControllerAnimated:YES];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //NSLog(@"prepare for seg");
    
}

-(void)viewWillDisappear:(BOOL)animated{
    

    
    [super viewWillDisappear: animated];
 

    
}


@end
