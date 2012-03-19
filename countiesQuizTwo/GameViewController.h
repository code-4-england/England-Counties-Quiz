//
//  GameViewController.h
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnswerViewController;
@class ResultsViewController;

@interface GameViewController : UIViewController

- (void)nextQuestion;

- (void)isAnswerCorrect;

- (IBAction)testModal:(UIButton *)sender;

- (void)gotoResults;

- (void)replay;

@property (strong, nonatomic) IBOutlet UIView *hideGame;


@property (strong, nonatomic) IBOutlet UITextField *countiesTextField;

@property (strong, nonatomic) IBOutlet UIImageView *Devon;

@property (strong, nonatomic) IBOutlet UIImageView *Lancashire;

@property (strong, nonatomic) IBOutlet UIImageView *Yorkshire;

@property (strong, nonatomic) IBOutlet UIImageView *London;

@property (strong, nonatomic) IBOutlet UIImageView *Cornwall;

@property (strong, nonatomic) IBOutlet UITextField *scoreText;

@property (strong, nonatomic) IBOutlet UITextField *questionNumberText;

@property (strong, nonatomic) IBOutlet UITextField *totalQuestionsText;

@property int currentAnswer;

@property int score;

@property int currentTurn;

@property int totalQuestions;


@property NSMutableArray *countyToGuessArray;

@property int countyToGuessNumber;


@end
