//
//  ResultsViewController.h
//  countiesQuizTwo
//
//  Created by Sam Baguley on 13/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameViewController.h"

#import "AnswerViewController.h"

@interface ResultsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *resultScoreTextField;

@property (strong, nonatomic) IBOutlet UITextField *resultTotalQsTextField;

@property (strong, nonatomic) IBOutlet UITextField *resultMessageField;


@property (strong, nonatomic) IBOutlet UILabel *resultTextField;

@property (strong, nonatomic) IBOutlet UIView *endResultsView;

@property (strong, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)goNextQuestion:(UIButton *)sender;

- (IBAction)playAgain:(id)sender;

@end
