//
//  ViewController.h
//  countiesQuizTwo
//
//  Created by Sam Baguley on 03/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameViewController.h"


@interface ViewController : UIViewController

@property (nonatomic, strong) NSString * isQuickGame;

- (IBAction)playFullGame:(id)sender;
- (IBAction)playQuickGame:(id)sender;

@end
