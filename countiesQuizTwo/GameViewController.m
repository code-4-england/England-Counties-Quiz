//
//  GameViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "AnswerViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController
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


- (void)nextQuestion
{
    
    
    NSLog(@"NEXT QUESTION");
    
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
    
    [self performSegueWithIdentifier:@"toResult" sender:self];
    
    NSLog(@">>>>>>>>>>>>> %@ <<<<<<<<<<<<<<<<", self.description);
    
    self.score = 0;
    
    self.totalQuestions = 5;
    
    self.currentTurn = 1;
    
    self.totalQuestionsText.text = [NSString stringWithFormat:@"%i", self.totalQuestions];
    
    self.questionNumberText.text = [NSString stringWithFormat:@"%i", self.currentTurn];
    
    int randomCounty = arc4random() % 4;
    
    self.countyToGuessNumber = randomCounty;
    
    NSString * scoreString = [NSString stringWithFormat:@"%i", 0];
    
    [self.scoreText setText:scoreString];
    
    //NSLog(@"countyToGuessNumber %i", ((CountyNavController *)self.parentViewController).currentCountyToGuess);

    
    NSMutableArray *allCounties = [[NSMutableArray alloc] initWithObjects:Devon,Cornwall,Yorkshire,London,Lancashire, nil];
    
	NSMutableArray *currentCounty = [[NSMutableArray alloc] init];
     
    [currentCounty addObject:[allCounties objectAtIndex:randomCounty]];
    
    //NSLog(@"name>>> %@",[currentCounty objectAtIndex:0]);
    
    [[currentCounty objectAtIndex:0] setHighlighted:YES];
    
    
    
    
    NSLog(@"Game screen loaded");
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)isAnswerCorrect{
    NSLog(@"Is answer correct");
   
    if(self.currentAnswer == self.countyToGuessNumber){
        NSLog(@"CORRECT!!!");
        
        self.score += 1;
         
        NSString* scoreString = [NSString stringWithFormat:@"%i", self.score];
        
        scoreText.text = scoreString;
        
        
        UIAlertView *alertDialog;
        alertDialog = [[UIAlertView alloc]
                       initWithTitle:@"Result" message:@"Correct!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        alertDialog.alertViewStyle=UIAlertViewStyleDefault;
        [alertDialog show];
        
        if(self.currentTurn == self.totalQuestions){
            
            NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxGo to result screen");
            
            [self performSegueWithIdentifier:@"toResults" sender:self];
        } else{
            [self nextQuestion];
        }
        
    } else {
        NSLog(@"WRONG!!!");
        
        UIAlertView *alertDialog;
        alertDialog = [[UIAlertView alloc]
                       initWithTitle:@"Result" message:@"Wrong!!!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        alertDialog.alertViewStyle=UIAlertViewStyleDefault;
        [alertDialog show];
        
        if(self.currentTurn == self.totalQuestions){
            
            NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxGo to result screen");
            
            [self performSegueWithIdentifier:@"toResults" sender:self];
        } else{
            [self nextQuestion];
        }
        
    }
     
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@"********************prepare for segue");
    /*
    AnswerViewController *answerViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
    
    //answerViewController.delegate = self;
    */
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
    [self setScoreText:nil];
    [self setQuestionNumberText:nil];
    [self setTotalQuestionsText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
