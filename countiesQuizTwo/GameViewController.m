//
//  GameViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"


@interface GameViewController ()

@end

@implementation GameViewController
@synthesize countiesTextField;
@synthesize Devon;
@synthesize Lancashire;
@synthesize Yorkshire;
@synthesize London;
@synthesize Cornwall;
@synthesize countyToGuessArray;
@synthesize countyToGuessNumber;

@synthesize testVar;


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
    
    //UIApplication *application = [UIApplication sharedApplication];
    self.testVar = 3333;
    //NSLog(@"testtest: %@", application.description);
    NSLog(@">>>>>testvar: %i", self.testVar);
    int randomCounty = arc4random() % 4;
    
    self.countyToGuessNumber = randomCounty;
    
    ((CountyNavController *)self.parentViewController).currentCountyToGuess = self.countyToGuessNumber;
    
    NSLog(@"countyToGuessNumber %i", ((CountyNavController *)self.parentViewController).currentCountyToGuess);

    
    NSMutableArray *allCounties = [[NSMutableArray alloc] initWithObjects:Devon,Cornwall,Yorkshire,London,Lancashire, nil];
    
	NSMutableArray *currentCounty = [[NSMutableArray alloc] init];
     
    [currentCounty addObject:[allCounties objectAtIndex:randomCounty]];
    
    NSLog(@"name>>> %@",[currentCounty objectAtIndex:0]);
    
    [[currentCounty objectAtIndex:0] setHighlighted:YES];


    NSLog(@"222 testprop %i", ((CountyNavController *)self.parentViewController).testProp);
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //NSLog(@"random county: %i", AppDelegate.randomCounty);
    
    //[self.countyToGuessArray addObject:London];
    
    //self.Cornwall.highlighted = YES;
      
    //NSLog(@"county to guess: %@" , [countyToGuessArray objectAtIndex:1]);
    
    //NSString *fish = [[countyToGuessArray objectAtIndex:0] description];    
    
   //int fish = [self.countyToGuessArray count];   
   
    //NSLog(@">>>>array count: %i",fish);
    
    // NSLog(@"%@", Devon.name);
          
    //[[countyToGuessArray objectAtIndex:1] setHighlighted:YES];
    
   // [London setHighlighted:YES];
    
    NSLog(@"Game screen loaded");
}

- (void)viewDidUnload
{
    [self setCountiesTextField:nil];
    [self setDevon:nil];
    [self setLancashire:nil];
    [self setYorkshire:nil];
    [self setLondon:nil];
    [self setYorkshire:nil];
    [self setCornwall:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)isAnswerCorrect:(int)countyAnswer currentHighlightedCounty:(int)correctAnswer{
    NSLog(@"Is answer correct");
   //NSLog(@">>>your answer: %i, %i", countyAnswer , self.testVar);
    NSLog(@">>>Current county to guess: %@", ((CountyNavController *)self.parentViewController).description);
    
    if(countyAnswer == correctAnswer){
        NSLog(@"CORRECT!!!");
        
        
        UIAlertView *alertDialog;
        alertDialog = [[UIAlertView alloc]
                       initWithTitle:@"Result" message:@"Correct!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        alertDialog.alertViewStyle=UIAlertViewStyleDefault;
        [alertDialog show];
        
    } else {
        NSLog(@"WRONG!!!");
        
        UIAlertView *alertDialog;
        alertDialog = [[UIAlertView alloc]
                       initWithTitle:@"Result" message:@"Wrong!!!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        alertDialog.alertViewStyle=UIAlertViewStyleDefault;
        [alertDialog show];
    }
     
    
}





@end
