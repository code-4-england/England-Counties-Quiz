//
//  GameViewController.h
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *countiesTextField;

@end
