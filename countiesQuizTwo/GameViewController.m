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
    
    NSString * scoreString = [NSString stringWithFormat:@"%i", 0];
    
    [self.scoreText setText:scoreString];    
    
    self.totalQuestionsText.text = [NSString stringWithFormat:@"%i", self.totalQuestions];
    
    self.questionNumberText.text = [NSString stringWithFormat:@"%i", self.currentTurn];
    
    int randomCounty = arc4random() % 4;
    
    self.countyToGuessNumber = randomCounty;
    
    NSMutableArray *allCounties = [[NSMutableArray alloc] initWithObjects:Devon,Cornwall,Yorkshire,London,Lancashire, nil];
    
	NSMutableArray *currentCounty = [[NSMutableArray alloc] init];
    
    [currentCounty addObject:[allCounties objectAtIndex:randomCounty]];
    
    [[currentCounty objectAtIndex:0] setHighlighted:YES];    
    
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
    
    int randomCounty = arc4random() % 4;

    self.currentTurn += 1;
    
    self.questionNumberText.text = [NSString stringWithFormat:@"%i", self.currentTurn];
    
    self.countyToGuessNumber = randomCounty;
    
    NSMutableArray *allCounties = [[NSMutableArray alloc] initWithObjects:Devon,Cornwall,Yorkshire,London,Lancashire, nil];
    
	NSMutableArray *currentCounty = [[NSMutableArray alloc] init];
    
    [currentCounty addObject:[allCounties objectAtIndex:randomCounty]];
    
    //NSLog(@"name>>> %@",[currentCounty objectAtIndex:0]);
    
    [Devon setHighlighted:NO];
    [Cornwall setHighlighted:NO];
    [Yorkshire setHighlighted:NO];
    [London setHighlighted:NO];
    [Lancashire setHighlighted:NO];
    
    [[currentCounty objectAtIndex:0] setHighlighted:YES];
    
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

- (void)isAnswerCorrect{
    
    /*
    NSLog(@"Is answer correct");
   
    if(self.currentAnswer == self.countyToGuessNumber){
        NSLog(@"CORRECT!!!");
        
        self.score += 1;
         
        NSString* scoreString = [NSString stringWithFormat:@"%i", self.score];
        
        scoreText.text = scoreString;
        
        if(self.currentTurn == self.totalQuestions){
            
            NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxGo to result screen");
            
            NSString * myString = [NSString  stringWithFormat: @"%@", [self description]];
            
            NSLog(@"SELF DESCRIPTION: %@", myString);
            
            [self gotoResults];  
            
            
        } else{
            [self nextQuestion];
        }
        
    } else {
        NSLog(@"WRONG!!!");
 
        if(self.currentTurn == self.totalQuestions){
            
            NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxGo to result screen");
            
            NSString * myString = [NSString  stringWithFormat: @"%@", [self description]];
            
            NSLog(@"SELF DESCRIPTION: %@", myString);
                                                   
            [self gotoResults];  
            
            
        } else{
            [self nextQuestion];
        }
        
    }
     */
    
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
