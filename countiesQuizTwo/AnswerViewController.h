//
//  AnswerViewController.h
//  countiesQuizTwo
//
//  Created by Sam Baguley on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"


@interface AnswerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>


@property int countySelected;

- (IBAction)doneAnswering:(id)sender;

- (void)closeAnswerView;

- (IBAction)backToMap:(id)sender;

/*
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIImage *image;

+ (CGFloat)viewWidth;
+ (CGFloat)viewHeight;
*/

@end
