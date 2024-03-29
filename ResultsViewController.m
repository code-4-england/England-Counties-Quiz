//
//  ResultsViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 13/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController;
@synthesize correctAnswerField;
@synthesize correctAnswerText;
@synthesize resultScoreTextField;
@synthesize resultTotalQsTextField;
@synthesize resultMessageField;
//@synthesize resultTextField;
@synthesize endResultsView;
@synthesize nextButton;
@synthesize resultsImage;
@synthesize rewardImage;

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
    
    
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentingViewController);
    
    
    GameViewController * gameController = ((GameViewController *)answerController.presentingViewController);
     
     
     
    if(gameController.countyToGuessNumber == gameController.currentAnswer){
        
        //resultTextField.hidden = NO;
        //resultTextField.text = @"correct";
        
        gameController.score += 1;
        
        NSString * currentImage = [NSString stringWithFormat:@"%@_green.png", [gameController.imageNameArray objectAtIndex:gameController.countyToGuessNumber]];  
        
        //NSLog(@"current image to replace %@",currentImage);
        
        
        correctAnswerField.hidden = YES;
        
        correctAnswerText.hidden = YES;
        
        resultsImage.hidden = NO;
        [resultsImage setImage:[UIImage imageNamed:@"correct_title.png"]];
        
        [[gameController.currentCountyArray objectAtIndex:0] setImage:[UIImage imageNamed:currentImage]];
        
    } else{
        
        if(gameController.currentAnswer >= 0){
            
            resultsImage.hidden = NO;
            [resultsImage setImage:[UIImage imageNamed:@"wrong_title.png"]];
            
            //resultTextField.hidden = NO;
        //resultTextField.text = @"wrong";
        }else{
            
            resultsImage.hidden = YES;
            //resultTextField.hidden = YES;
            
        }
        
        NSString * currentImage = [NSString stringWithFormat:@"%@_grey.png", [gameController.imageNameArray objectAtIndex:gameController.countyToGuessNumber]];  
        
        //NSLog(@"current image to replace %@",currentImage);
        
        correctAnswerField.hidden = NO;
        
        correctAnswerText.hidden = NO;
        
        correctAnswerField.text =
        [gameController.countyNameArray objectAtIndex:gameController.countyToGuessNumber];
        
        [[gameController.currentCountyArray objectAtIndex:0] setImage:[UIImage imageNamed:currentImage]];
    }
    
    
    NSString *scoreString = [NSString stringWithFormat:@"%i",gameController.score];
    
    NSString *totalString = [NSString stringWithFormat:@"%i",gameController.totalQuestions];
    
    
    if(gameController.currentTurn == gameController.totalQuestions){
        
        
        //NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxEnd of Game");
        endResultsView.hidden = NO;
        
        nextButton.hidden = YES;
        
        //resultTextField.hidden = YES;
        
        
        if(gameController.totalQuestions == 10){
        
            if(gameController.score == gameController.totalQuestions){
           
                self.resultMessageField.text = @"Perfect score! Congratulations!";
                
                self.rewardImage.hidden = NO;
                
            } else{
           
                if(gameController.score >= 7){
            
                    self.resultMessageField.text = @"Great score!";
                    
                    self.rewardImage.hidden = YES;
                }
            
                if(gameController.score < 7){
                
                    self.resultMessageField.text = @"";
                
                    self.rewardImage.hidden = YES;
                
                }
            }
         
        }
        
        if(gameController.totalQuestions == 47){
            
            if(gameController.score == 47){
                
                self.resultMessageField.text = @"Perfect score! Congratulations!";
                
                self.rewardImage.hidden = NO;
                
            }else{
            
                if(gameController.score >= 30){
                
                    self.resultMessageField.text = @"Great score!";
                
                    self.rewardImage.hidden = YES;
                
                }
            
                if(gameController.score < 30){
                
                    self.resultMessageField.text = @"";
                
                    self.rewardImage.hidden = YES;
                
                }
            }
            
        }
        
        
        
        
        self.resultScoreTextField.text = scoreString;
    
        self.resultTotalQsTextField.text = totalString;
        
        
        
    } else{
        endResultsView.hidden = YES;
    }

    
}

- (void)viewDidUnload
{
    [self setResultScoreTextField:nil];
    [self setResultTotalQsTextField:nil];
    [self setResultMessageField:nil];
    //[self setResultTextField:nil];
    [self setEndResultsView:nil];
    [self setNextButton:nil];
    [self setCorrectAnswerField:nil];
    [self setCorrectAnswerText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goNextQuestion:(UIButton *)sender {
    
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentingViewController);
    
     
    GameViewController * gameController = ((GameViewController *)answerController.presentingViewController);
    
    
    [gameController nextQuestion];
    
}

- (IBAction)playAgain:(id)sender {
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentingViewController);
    
    
    GameViewController * gameController = ((GameViewController *)answerController.presentingViewController);
    
    
    [gameController replay];    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //NSLog(@"prepare for seg");
    
    //AnswerViewController * answerController = ((AnswerViewController *)self.presentingViewController);
    
    //[answerController closeAnswerView];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
    //NSLog(@"Results view will disappear.");
    
    [super viewWillDisappear: animated];
    
}


@end
