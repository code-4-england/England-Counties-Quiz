//
//  CountyNavController.h
//  countiesQuizTwo
//
//  Created by Sam Baguley on 08/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"

@interface CountyNavController : UINavigationController

@property (nonatomic) int testProp;

@property (nonatomic) int currentCountyToGuess;
@property (nonatomic) int currentCountyAnswer;
@property (nonatomic) int score;


@end
