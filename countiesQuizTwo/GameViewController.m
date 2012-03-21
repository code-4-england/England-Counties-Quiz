//
//  GameViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "AnswerViewController.h"
#import "ResultsViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize hideGame;
@synthesize countiesTextField;
@synthesize Devon;
@synthesize Lancashire;
@synthesize Yorkshire;
@synthesize London;
@synthesize Cornwall;
@synthesize scoreText;
@synthesize questionNumberText;
@synthesize totalQuestionsText;
@synthesize countyToGuessArray;
@synthesize countyToGuessNumber;
@synthesize score;
@synthesize currentAnswer;
@synthesize currentTurn;
@synthesize totalQuestions;

@synthesize imageNameArray;

@synthesize allCountiesArray;

@synthesize currentCountyArray;

@synthesize usedCountiesArray;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    
    
    }
    return self;
    
    
}


-(void)resetGame{
    
    
    NSLog(@"RESET GAME");
    
    
    
    self.score = 0;
    
    self.totalQuestions = 5;
    
    self.currentTurn = 1;  
    
    usedCountiesArray = [[NSMutableArray alloc] init];
    
    NSString * scoreString = [NSString stringWithFormat:@"%i", 0];
    
    [self.scoreText setText:scoreString];    
    
    self.totalQuestionsText.text = [NSString stringWithFormat:@"%i", self.totalQuestions];
    
    self.questionNumberText.text = [NSString stringWithFormat:@"%i", self.currentTurn];
    
    NSNumber *randomCounty = [[NSNumber alloc] initWithInt:999999];
    
    randomCounty = [NSNumber numberWithInt:arc4random() % 5];
        
    NSLog(@">>>>>>random county: %@",randomCounty);
        
    //NSNumber *randomCountyTest = [[NSNumber alloc] initWithInt:randomCounty];
    
    self.countyToGuessNumber = [randomCounty intValue];
    
    allCountiesArray = [[NSArray alloc] initWithObjects:Devon,Cornwall,Yorkshire,London,Lancashire, nil];
    
    imageNameArray = [[NSArray alloc] initWithObjects:@"countyA",@"countyC",@"countyD",@"countyE",@"countyB", nil];
    
    [usedCountiesArray addObject:randomCounty]; 
    
    //NSNumber *usedCounty = [[NSNumber alloc] initWithInt:countyToGuessNumber];
    
    //[usedCountiesArray addObject:usedCounty];
    
	currentCountyArray = [[NSMutableArray alloc] init];
    
    [currentCountyArray addObject:[allCountiesArray objectAtIndex:countyToGuessNumber]];
    
    
    [Devon setImage:[UIImage imageNamed:@"countyA.png"]];
    [Cornwall setImage:[UIImage imageNamed:@"countyC.png"]];
    [Yorkshire setImage:[UIImage imageNamed:@"countyD.png"]];
    [London setImage:[UIImage imageNamed:@"countyE.png"]];
    [Lancashire setImage:[UIImage imageNamed:@"countyB.png"]];

    
    [Devon setHighlighted:NO];
    [Cornwall setHighlighted:NO];
    [Yorkshire setHighlighted:NO];
    [London setHighlighted:NO];
    [Lancashire setHighlighted:NO];
    
    
    [[currentCountyArray objectAtIndex:0] setHighlighted:YES];    
    
}



- (void)nextQuestion
{
    
    
    NSLog(@"NEXT QUESTION");
    
    ResultsViewController * resultController = ((ResultsViewController *)self.presentedViewController);
    
    [resultController dismissModalViewControllerAnimated:NO]; 
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentedViewController);
    
    [answerController dismissModalViewControllerAnimated:NO];   
    
    NSString * scoreString = [NSString stringWithFormat:@"%i", self.score];
    
    [self.scoreText setText:scoreString]; 
    
    NSNumber *randomCounty = [[NSNumber alloc] initWithInt:999999];
    
    //NSNumber *numberToTest = [[NSNumber alloc] initWithInt:randomCounty];
    
    NSLog(@"used countries%@", [usedCountiesArray description]);
    
    do{
    
        randomCounty = [NSNumber numberWithInt:arc4random() % 5];
        
        NSLog(@">>>>>>random county: %@",randomCounty);
        
        if([usedCountiesArray containsObject:randomCounty]){
            
            NSLog(@"duplicate");
            
        }
        
        //NSNumber *randomCountyTest = [[NSNumber alloc] initWithInt:randomCounty];
         
    }  while([usedCountiesArray containsObject:randomCounty]);
        
    
    [usedCountiesArray addObject:randomCounty];
    
    self.currentTurn += 1;
    
    self.questionNumberText.text = [NSString stringWithFormat:@"%i", self.currentTurn];
    
    self.countyToGuessNumber = [randomCounty intValue];
    
    
    [currentCountyArray replaceObjectAtIndex:0 withObject:[allCountiesArray objectAtIndex:countyToGuessNumber]];
    
    //NSLog(@"name>>> %@",[currentCounty objectAtIndex:0]);
    
    [Devon setHighlighted:NO];
    [Cornwall setHighlighted:NO];
    [Yorkshire setHighlighted:NO];
    [London setHighlighted:NO];
    [Lancashire setHighlighted:NO];
    
    [[currentCountyArray objectAtIndex:0] setHighlighted:YES];
    
}




- (void)viewDidLoad
{
    
    NSLog(@"Game screen loaded");
    
    [super viewDidLoad];
    
    [self resetGame];

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)gotoResults {
    
    
    
    NSLog(@"to Results");
    
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentedViewController);
    
    //[answerController dismissModalViewControllerAnimated:YES];    
    
    [answerController performSegueWithIdentifier:@"toResults" sender:answerController];
    
    
}


- (IBAction)testModal:(UIButton *)sender {
    
    
    NSLog(@"button pressed");
    

    
    [self performSegueWithIdentifier:@"toResults" sender:self];
    
    
}


- (void)replay
{
    
    NSLog(@"REPLAY");
    
    ResultsViewController * resultController = ((ResultsViewController *)self.presentedViewController);
    
    [resultController dismissModalViewControllerAnimated:NO]; 
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentedViewController);
    
    [answerController dismissModalViewControllerAnimated:NO];   
    
    [self resetGame];
    
}



- (void)viewDidUnload
{
    
    NSLog(@"Game view controller did unload.");
    
    [self setCountiesTextField:nil];
    [self setDevon:nil];
    [self setLancashire:nil];
    [self setYorkshire:nil];
    [self setLondon:nil];
    [self setYorkshire:nil];
    [self setCornwall:nil];
    [self setScoreText:nil];
    [self setQuestionNumberText:nil];
    [self setTotalQuestionsText:nil];
    [self setHideGame:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
