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

- (void)gotoResults;

- (void)replay;

@property (strong, nonatomic) IBOutlet UIView *hideGame;

@property (strong, nonatomic) IBOutlet UITextField *countiesTextField;

@property (strong, nonatomic) IBOutlet UIImageView *northumberland;
@property (strong, nonatomic) IBOutlet UIImageView *durham;

@property (strong, nonatomic) IBOutlet UIImageView *cumbria;

@property (strong, nonatomic) IBOutlet UIImageView *tyneAndWear;


@property (strong, nonatomic) IBOutlet UITextField *scoreText;

@property (strong, nonatomic) IBOutlet UITextField *questionNumberText;

@property (strong, nonatomic) IBOutlet UITextField *totalQuestionsText;

@property (strong, nonatomic) IBOutlet UIImageView *northYorkshire;

@property (strong, nonatomic) IBOutlet UIImageView *lancashire;

@property (strong, nonatomic) IBOutlet UIImageView *westYorkshire;

@property (strong, nonatomic) IBOutlet UIImageView *eastRiding;

@property (strong, nonatomic) NSArray *imageNameArray;

@property (strong, nonatomic) NSArray *allCountiesArray;

@property (strong, nonatomic) NSArray *countyNameArray;

@property (strong, nonatomic) NSMutableArray *usedCountiesArray;

@property (strong, nonatomic) NSMutableArray *currentCountyArray;

@property (strong, nonatomic) IBOutlet UIImageView *southYorkshire;

@property (strong, nonatomic) IBOutlet UIImageView *greaterManchester;
@property (strong, nonatomic) IBOutlet UIImageView *merseyside;

@property (strong, nonatomic) IBOutlet UIImageView *cheshire;

@property (strong, nonatomic) IBOutlet UIImageView *staffordshire;

@property (strong, nonatomic) IBOutlet UIImageView *derbyshire;

@property (strong, nonatomic) IBOutlet UIImageView *lincolnshire;

@property (strong, nonatomic) IBOutlet UIImageView *nottinghamshire;

@property (strong, nonatomic) IBOutlet UIImageView *shropshire;
@property (strong, nonatomic) IBOutlet UIImageView *westMidlands;
@property int currentAnswer;

@property int score;

@property int currentTurn;

@property int totalCounties;

@property int totalQuestions;

@property (strong, nonatomic) IBOutlet UIImageView *cornwall;

@property (strong, nonatomic) IBOutlet UIImageView *devon;
@property (strong, nonatomic) IBOutlet UIImageView *dorset;
@property (strong, nonatomic) IBOutlet UIImageView *somerset;
@property (strong, nonatomic) IBOutlet UIImageView *hampshire;
@property (strong, nonatomic) IBOutlet UIImageView *westSussex;
@property (strong, nonatomic) IBOutlet UIImageView *eastSussex;
@property (strong, nonatomic) IBOutlet UIImageView *kent;
@property (strong, nonatomic) IBOutlet UIImageView *isleOfWight;
@property (strong, nonatomic) IBOutlet UIImageView *wiltshire;
@property (strong, nonatomic) IBOutlet UIImageView *berkshire;
@property (strong, nonatomic) IBOutlet UIImageView *surrey;
@property (strong, nonatomic) IBOutlet UIImageView *greaterLondon;
@property (strong, nonatomic) IBOutlet UIImageView *essex;
@property (strong, nonatomic) IBOutlet UIImageView *hertfordshire;
@property (strong, nonatomic) IBOutlet UIImageView *buckinghamshire;
@property (strong, nonatomic) IBOutlet UIImageView *oxfordshire;
@property (strong, nonatomic) IBOutlet UIImageView *gloucestershire;
@property (strong, nonatomic) IBOutlet UIImageView *herefordshire;
@property (strong, nonatomic) IBOutlet UIImageView *worcestershire;
@property (strong, nonatomic) IBOutlet UIImageView *warwickshire;
@property (strong, nonatomic) IBOutlet UIImageView *bedfordshire;
@property (strong, nonatomic) IBOutlet UIImageView *cambridgeshire;
@property (strong, nonatomic) IBOutlet UIImageView *suffolk;
@property (strong, nonatomic) IBOutlet UIImageView *norfolk;
@property (strong, nonatomic) IBOutlet UIImageView *leicestershire;
@property (strong, nonatomic) IBOutlet UIImageView *northamptonshire;
@property (strong, nonatomic) IBOutlet UIImageView *rutland;
@property (strong, nonatomic) IBOutlet UIImageView *bristol;


@property NSMutableArray *countyToGuessArray;

@property int countyToGuessNumber;


@end
