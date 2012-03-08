//
//  GameViewController.h
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CountyNavController.h"



@interface GameViewController : UIViewController {
    NSMutableArray *countyToGuessArray;
    
    int countyToGuessNumber;
    
    int testVar;
    
}


- (void)isAnswerCorrect:(int)countyAnswer currentHighlightedCounty:(int)correctAnswer;

@property (strong, nonatomic) IBOutlet UITextField *countiesTextField;

@property (strong, nonatomic) IBOutlet UIImageView *Devon;

@property (strong, nonatomic) IBOutlet UIImageView *Lancashire;

@property (strong, nonatomic) IBOutlet UIImageView *Yorkshire;

@property (strong, nonatomic) IBOutlet UIImageView *London;

@property (strong, nonatomic) IBOutlet UIImageView *Cornwall;

@property NSMutableArray *countyToGuessArray;

@property int countyToGuessNumber;

@property int testVar;


@end
