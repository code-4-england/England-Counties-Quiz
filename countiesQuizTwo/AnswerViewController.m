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


//@synthesize title, image;

/*
const CGFloat kViewWidth = 200;
const CGFloat kViewHeight = 44;

+ (CGFloat)viewWidth
{
    return kViewWidth;
}

+ (CGFloat)viewHeight
{
    return kViewHeight;
}
*/


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.backgroundColor = [UIColor clearColor];    // make the background transparent
    }
    return self;
}
 

/*
- (id)initWithFrame:(CGRect)frame
{
    // use predetermined frame size
    self = [super initWithFrame:CGRectMake(0.0, 0.0, kViewWidth, kViewHeight)];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];    // make the background transparent
    }
    return self;
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   // NSLog(@"test test test>>>> %i", ((GameViewController *)self.presentingViewController).score);
    self.countySelected = -1;
    
    ((GameViewController *)self.presentingViewController).currentAnswer = -1;
    
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
	return 48; 
}

/*
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component { 
    
                                
    NSArray *pickerArray = ((GameViewController *)self.presentingViewController).countyNameArray;
    
	
    if(row == 0){
        
        return @"Don't Know";
        
    }
    
    return [pickerArray objectAtIndex:row -1];
    
    
}
 
*/



- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component { 
    
    self.countySelected = row;
    
    ((GameViewController *)self.presentingViewController).currentAnswer = row - 1;

    //-1 is included to account for the first line 'don't know'
    
    
    //NSLog(@"row selected:%i", row);
    
    //NSLog(@"county selected");
    
}


/*
- (void)drawRect:(CGRect)rect
{
    // draw the image and title using their draw methods
    CGFloat yCoord = (self.bounds.size.height - self.image.size.height) / 2;
    CGPoint point = CGPointMake(10.0, yCoord);
    [self.image drawAtPoint:point];
    
    yCoord = (self.bounds.size.height - MAIN_FONT_SIZE) / 2;
    point = CGPointMake(10.0 + self.image.size.width + 10.0, yCoord);
    [self.title drawAtPoint:point
                   forWidth:self.bounds.size.width
                   withFont:[UIFont systemFontOfSize:MAIN_FONT_SIZE]
                minFontSize:MIN_MAIN_FONT_SIZE
             actualFontSize:NULL
              lineBreakMode:UILineBreakModeTailTruncation
         baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
}
*/



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    
    
    UILabel* tView = (UILabel*)view;
    
    NSArray *pickerArray = ((GameViewController *)self.presentingViewController).countyNameArray;
    
    if ((tView == nil) || ([tView class] != [UILabel class]) ){
        
       CGRect frame = CGRectMake(20.0, 0.0, 200, 30.0);
        
        
        tView = [[UILabel alloc] initWithFrame:frame];
        
        //tView.font = [UIFont systemFontOfSize:16];
        
        tView.textAlignment = UITextAlignmentCenter;
        
        tView.font = [UIFont fontWithName:@"Avenir-Black" size:16];
        
        tView.backgroundColor = [UIColor clearColor];
        
        
        // Setup label properties - frame, font, colors etc
        
 
            
    
       
    }
    
    if(row == 0){
        
        tView.text = @"Don't Know";
        
    } else{
        
        tView.text = [pickerArray objectAtIndex:row - 1];
        
    }
    
    
    // Fill the label text here
    
    return tView;
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
