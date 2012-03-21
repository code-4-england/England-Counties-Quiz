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
    
     NSLog(@"county selected: 0");
    
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
	return 48; 
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component { 
    
    //NSArray * countiesArray = [NSArray arrayWithObjects:@"Devon",@"Cornwall",@"Yorkshire",@"London",@"Lancashire", nil];
    
    //NOTE: I've missed out city of London - don't think this is really county.
    
    NSArray * countiesArray = [NSArray arrayWithObjects:
    @"Avon",
    @"Bedfordshire",
    @"Berkshire",
    @"City of Bristol",
    @"Buckinghamshire",
    @"Cambridgeshire",
    @"Cheshire",
    @"Cornwall",
    @"Cumbria",
    @"Derbyshire",
    @"Devon",
    @"Dorset",
    @"Durham",
    @"East Sussex",
    @"Essex",
    @"Gloucestershire",
    @"Greater London",
    @"Greater Manchester",
    @"Hampshire",
    @"Herefordshire",
    @"Hertfordshire",
    @"Isle of Wight",
    @"Kent",
    @"Lancashire",
    @"Leicestershire",
    @"Lincolnshire",
    @"Merseyside",
    @"Norfolk",
    @"Northamptonshire",
    @"Northumberland",
    @"North Yorkshire",
    @"Nottinghamshire",
    @"Oxfordshire",
    @"Rutland",
    @"Shropshire",
    @"Somerset",
    @"South Yorkshire",
    @"Staffordshire",
    @"Suffolk",
    @"Surrey",
    @"Tyne and Wear",
    @"Warwickshire",
    @"West Midlands",
    @"West Sussex",
    @"West Yorkshire",
    @"Wiltshire",
    @"Worcestershire",
    @"Yorkshire, East Riding", nil];
                               
    
    
	return [countiesArray objectAtIndex:row]; 
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component { 
    
    self.countySelected = row;
    
    ((GameViewController *)self.presentingViewController).currentAnswer = row;
    
    NSLog(@"row selected:%i", row);
    
    NSLog(@"county selected");
    
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepare for seg");
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
   // NSLog(@"*************** %@",[[self delegate] description]);
    
/*    
    
    GameViewController *gameViewController = ((GameViewController *)self.presentingViewController);
    
    [gameViewController isAnswerCorrect];
    
     
    
  
 */
    
    [super viewWillDisappear: animated];
 
      //NSLog(@">*>*>*>*>*>*>* %@", self.presentingViewController.description);
    
    
}


@end
