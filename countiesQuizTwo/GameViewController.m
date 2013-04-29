//
//  GameViewController.m
//  countiesQuizTwo
//
//  Created by Sam Baguley on 06/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "AnswerViewController.h"
#import "ResultsViewController.h"


@interface GameViewController ()

@end

@implementation GameViewController
@synthesize hideGame;
@synthesize countiesTextField;

@synthesize scoreText;
@synthesize questionNumberText;
@synthesize totalQuestionsText;
@synthesize countyToGuessArray;
@synthesize countyToGuessNumber;
@synthesize score;
@synthesize currentAnswer;
@synthesize currentTurn;
@synthesize totalQuestions;

@synthesize totalCounties;
@synthesize countyNameArray;

@synthesize imageNameArray;
@synthesize allCountiesArray;
@synthesize currentCountyArray;
@synthesize usedCountiesArray;

@synthesize northumberland;
@synthesize durham;
@synthesize cumbria;
@synthesize tyneAndWear;
@synthesize northYorkshire;
@synthesize lancashire;
@synthesize westYorkshire;
@synthesize eastRiding;
@synthesize cornwall;
@synthesize devon;
@synthesize dorset;
@synthesize somerset;
@synthesize hampshire;
@synthesize westSussex;
@synthesize eastSussex;
@synthesize kent;
@synthesize isleOfWight;
@synthesize wiltshire;
@synthesize berkshire;
@synthesize surrey;
@synthesize greaterLondon;
@synthesize essex;
@synthesize hertfordshire;
@synthesize buckinghamshire;
@synthesize oxfordshire;
@synthesize gloucestershire;
@synthesize herefordshire;
@synthesize worcestershire;
@synthesize warwickshire;
@synthesize bedfordshire;
@synthesize cambridgeshire;
@synthesize suffolk;
@synthesize norfolk;
@synthesize leicestershire;
@synthesize northamptonshire;
@synthesize rutland;
@synthesize bristol;
@synthesize lincolnshire;
@synthesize southYorkshire;
@synthesize greaterManchester;
@synthesize merseyside;
@synthesize cheshire;
@synthesize staffordshire;
@synthesize derbyshire;
@synthesize nottinghamshire;
@synthesize shropshire;
@synthesize westMidlands;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    
    
    }
    return self;
    
    
}


-(void)unHighlightAll{
    
    for(UIImageView *imageToReset in allCountiesArray)
    {    
        
        [imageToReset setHighlighted:NO];
    
        
    }
    
    
    
}


-(void)resetGame{
    
    
    NSLog(@"RESET GAME");
    
    self.score = 0;
    
    ViewController * initialViewController = ((ViewController *)self.presentingViewController);
    
    if([initialViewController.isQuickGame isEqual: @"YES"]){
        
        self.totalQuestions = 10;
        
    } else {
        
        self.totalQuestions = 47;
        
    }
    
    
    
    self.totalCounties = 47;
    
    self.currentTurn = 1;  
    
    usedCountiesArray = [[NSMutableArray alloc] init];
    
    NSString * scoreString = [NSString stringWithFormat:@"%i", 0];
    
    [self.scoreText setText:scoreString];    
    
    self.totalQuestionsText.text = [NSString stringWithFormat:@"%i", self.totalQuestions];
    
    self.questionNumberText.text = [NSString stringWithFormat:@"%i", self.currentTurn];
    
    NSNumber *randomCounty = [[NSNumber alloc] init];
    
    randomCounty = [NSNumber numberWithInt:arc4random() % self.totalCounties];
        
    NSLog(@"First County to guess: %@",[countyNameArray objectAtIndex:[randomCounty intValue]]);
    
    self.countyToGuessNumber = [randomCounty intValue];
    
    [usedCountiesArray addObject:randomCounty]; 
    
	currentCountyArray = [[NSMutableArray alloc] init];
    
    [currentCountyArray addObject:[allCountiesArray objectAtIndex:countyToGuessNumber]];
    
    //NSLog(@"name>>> %@",[currentCountyArray objectAtIndex:0]);
    
    for(UIImageView *imageToReset in allCountiesArray)
    {    
        
        [imageToReset setHighlighted:NO];
        
        
        NSString *pngName = [imageNameArray objectAtIndex:[allCountiesArray indexOfObject:imageToReset]];
        
        NSString *pngFile = [NSString stringWithFormat:@"%@%@",pngName,@".png"]; 
        
        
        [imageToReset setImage:[UIImage imageNamed:pngFile]];
        
    }
     
    
    [[currentCountyArray objectAtIndex:0] setHighlighted:YES];    
    
}



- (void)nextQuestion
{
    
    
    NSLog(@"NEXT QUESTION");
    
    ResultsViewController * resultController = ((ResultsViewController *)self.presentedViewController);
    
    [resultController dismissModalViewControllerAnimated:NO]; 
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentedViewController);
    
    [answerController dismissModalViewControllerAnimated:NO];   
    
    NSString * scoreString = [NSString stringWithFormat:@"%i", self.score];
    
    [self.scoreText setText:scoreString]; 
    
    NSNumber *randomCounty = [[NSNumber alloc] init];
    
    //NSLog(@"used countries%@", [usedCountiesArray description]);
    
    do{
    
        randomCounty = [NSNumber numberWithInt:arc4random() % self.totalCounties];
        
        //NSLog(@">>>>>>random county: %@",randomCounty);
        
        if([usedCountiesArray containsObject:randomCounty]){
            
            //NSLog(@"duplicate");
            
        }
         
    }  while([usedCountiesArray containsObject:randomCounty]);
        
    
    [usedCountiesArray addObject:randomCounty];
    
    self.currentTurn += 1;
    
    self.questionNumberText.text = [NSString stringWithFormat:@"%i", self.currentTurn];
    
    self.countyToGuessNumber = [randomCounty intValue];
    
    
    [currentCountyArray replaceObjectAtIndex:0 withObject:[allCountiesArray objectAtIndex:countyToGuessNumber]];
    
    //NSLog(@"name>>> %@",[currentCountyArray objectAtIndex:0]);
    
    
    NSLog(@"County to guess: %@",[countyNameArray objectAtIndex:countyToGuessNumber]);
    
    
    [self unHighlightAll];

    
    [[currentCountyArray objectAtIndex:0] setHighlighted:YES];
    
}




- (void)viewDidLoad
{
    
    NSLog(@"Game screen loaded");
    
    [super viewDidLoad];
    
    self.countyNameArray = [NSArray arrayWithObjects:
                               @"Bedfordshire",
                               @"Berkshire",
                               @"Bristol",
                               @"Buckinghamshire",
                               @"Cambridgeshire",
                               @"Cheshire",
                               @"Cornwall",
                               @"Cumbria",
                               @"Derbyshire",
                               @"Devon",
                               @"Dorset",
                               @"Durham",
                               @"East Riding of Yorkshire",
                               @"East Sussex",
                               @"Essex",
                               @"Gloucestershire",
                               @"Greater London",
                               @"Greater Manchester",
                               @"Hampshire",
                               @"Herefordshire",
                               @"Hertfordshire",
                               @"Isle of Wight",
                               @"Kent",
                               @"Lancashire",
                               @"Leicestershire",
                               @"Lincolnshire",
                               @"Merseyside",
                               @"Norfolk",
                               @"Northamptonshire",
                               @"Northumberland",
                               @"North Yorkshire",
                               @"Nottinghamshire",
                               @"Oxfordshire",
                               @"Rutland",
                               @"Shropshire",
                               @"Somerset",
                               @"South Yorkshire",
                               @"Staffordshire",
                               @"Suffolk",
                               @"Surrey",
                               @"Tyne and Wear",
                               @"Warwickshire",
                               @"West Midlands",
                               @"West Sussex",
                               @"West Yorkshire",
                               @"Wiltshire",
                               @"Worcestershire", nil];
                               
    
    self.allCountiesArray = [NSArray arrayWithObjects:
                             bedfordshire,
                             berkshire,
                             bristol,
                             buckinghamshire,
                             cambridgeshire,
                             cheshire,
                             cornwall,
                             cumbria,
                             derbyshire,
                             devon,
                             dorset,
                             durham,
                             eastRiding,
                             eastSussex,
                             essex,
                             gloucestershire,
                             greaterLondon,
                             greaterManchester,
                             hampshire,
                             herefordshire,
                             hertfordshire,
                             isleOfWight,
                             kent,
                             lancashire,
                             leicestershire,
                             lincolnshire,
                             merseyside,
                             norfolk,
                             northamptonshire,
                             northumberland,
                             northYorkshire,
                             nottinghamshire,
                             oxfordshire,
                             rutland,
                             shropshire,
                             somerset,
                             southYorkshire,
                             staffordshire,
                             suffolk,
                             surrey,
                             tyneAndWear,
                             warwickshire,
                             westMidlands,
                             westSussex,
                             westYorkshire,
                             wiltshire,
                             worcestershire,nil];

    self.imageNameArray = [NSArray arrayWithObjects:
                           @"bedfordshire",
                           @"berkshire",
                           @"bristol",
                           @"buckinghamshire",
                           @"cambridgeshire",
                           @"cheshire",
                           @"cornwall",
                           @"cumbria",
                           @"derbyshire",
                           @"devon",
                           @"dorset",
                           @"durham",
                           @"east_riding_of_yorkshire",
                           @"east_sussex",
                           @"essex",
                           @"gloucestershire",
                           @"greater_london",
                           @"greater_manchester",
                           @"hampshire",
                           @"herefordshire",
                           @"hertfordshire",
                           @"isle_of_wight",
                           @"kent",
                           @"lancashire",
                           @"leicestershire",
                           @"lincolnshire",
                           @"merseyside",
                           @"norfolk",
                           @"northamptonshire",
                           @"northumberland",
                           @"north_yorkshire",
                           @"nottinghamshire",
                           @"oxfordshire",
                           @"rutland",
                           @"shropshire",
                           @"somerset",
                           @"south_yorkshire",
                           @"staffordshire",
                           @"suffolk",
                           @"surrey",
                           @"tyne_and_wear",
                           @"warwickshire",
                           @"west_midlands",
                           @"west_sussex",
                           @"west_yorkshire",
                           @"wiltshire",
                           @"worcestershire", nil];

    
    [self resetGame];

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)gotoResults {
    
    
    
   // NSLog(@"to Results");
    
    NSLog(@"Current answer:%i", self.currentAnswer );
    

    AnswerViewController * answerController = ((AnswerViewController *)self.presentedViewController);
    [answerController performSegueWithIdentifier:@"toResults" sender:answerController];
    
/*
}else{
        NSLog(@"Don't Know Selected");
        
        
        if(self.currentTurn == self.totalQuestions){
            AnswerViewController * answerController = ((AnswerViewController *)self.presentedViewController);
            [answerController performSegueWithIdentifier:@"toResults" sender:answerController];
        }else {
            [self nextQuestion];
        }
        
        
    }
 
 */
    
}



- (void)replay
{
    
    NSLog(@"REPLAY");
    
    ResultsViewController * resultController = ((ResultsViewController *)self.presentedViewController);
    
    [resultController dismissModalViewControllerAnimated:NO]; 
    
    AnswerViewController * answerController = ((AnswerViewController *)self.presentedViewController);
    
    [answerController dismissModalViewControllerAnimated:NO];   
    
    [self resetGame];
    
    [self dismissModalViewControllerAnimated:NO];   
    
    
    
}

- (IBAction)restartGame:(id)sender {

    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"Are you sure you want to restart?"
                   message:@"" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    [alertDialog show];
    
    
    
    
    

}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"Yes"]){
        [self replay];
    }else if([buttonTitle isEqualToString:@"No"]){
        // Do nothing
        
    }
    
    
    
}


- (void)viewDidUnload
{
    
    NSLog(@"Game view controller did unload.");
    
    [self setCountiesTextField:nil];
    [self setDevon:nil];
    [self setLancashire:nil];
    [self setCornwall:nil];
    [self setScoreText:nil];
    [self setQuestionNumberText:nil];
    [self setTotalQuestionsText:nil];
    [self setHideGame:nil];
    [self setNorthumberland:nil];
    [self setCumbria:nil];
    [self setTyneAndWear:nil];
    [self setDurham:nil];
    [self setNorthYorkshire:nil];
    [self setLancashire:nil];
    [self setWestYorkshire:nil];
    [self setEastRiding:nil];
    [self setSouthYorkshire:nil];
    [self setGreaterManchester:nil];
    [self setMerseyside:nil];
    [self setCheshire:nil];
    [self setStaffordshire:nil];
    [self setDerbyshire:nil];
    [self setLincolnshire:nil];
    [self setNottinghamshire:nil];
    [self setShropshire:nil];
    [self setWestMidlands:nil];
    [self setCornwall:nil];
    [self setDevon:nil];
    [self setDorset:nil];
    [self setSomerset:nil];
    [self setHampshire:nil];
    [self setWestSussex:nil];
    [self setEastSussex:nil];
    [self setKent:nil];
    [self setIsleOfWight:nil];
    [self setWiltshire:nil];
    [self setBerkshire:nil];
    [self setSurrey:nil];
    [self setGreaterLondon:nil];
    [self setEssex:nil];
    [self setHertfordshire:nil];
    [self setBuckinghamshire:nil];
    [self setOxfordshire:nil];
    [self setGloucestershire:nil];
    [self setHerefordshire:nil];
    [self setWorcestershire:nil];
    [self setWarwickshire:nil];
    [self setBedfordshire:nil];
    [self setCambridgeshire:nil];
    [self setSuffolk:nil];
    [self setNorfolk:nil];
    [self setLincolnshire:nil];
    [self setLeicestershire:nil];
    [self setNorthamptonshire:nil];
    [self setRutland:nil];
    [self setBristol:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
