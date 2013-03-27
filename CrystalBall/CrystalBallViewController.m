//
//  CrystalBallViewController.m
//  CrystalBall
//
//  Created by Mike Berlin on 3/26/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "CrystalBallViewController.h"

@interface CrystalBallViewController ()

@end

NSArray *futures;
BOOL isOverFortuneLimit;
int fortuneLimit = 0;

@implementation CrystalBallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.lblFortune.text = @"...";
    futures = [NSArray arrayWithObjects:@"It's totally gonna happen!", @"Do it, what could go wrong?", @"lol. You're screwed.", @"Difficult to see", @"Much pain in your future, do I see.", @"You should probably bet on black.", nil];

    isOverFortuneLimit = [[NSUserDefaults standardUserDefaults] boolForKey:@"IsOverage"];
    [self showHideFourtune];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNextFuture:(id)sender
{
    fortuneLimit = fortuneLimit + 1;
    [self showHideFourtune];

    if (isOverFortuneLimit) return;

    self.lblFortune.text = [futures objectAtIndex:arc4random_uniform([futures count])];
    self.lblFortune.numberOfLines = 0;
    self.lblFortune.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)showHideFourtune
{
    isOverFortuneLimit = ((fortuneLimit > 3) || isOverFortuneLimit);
    [[NSUserDefaults standardUserDefaults] setBool:isOverFortuneLimit forKey:@"IsOverage"];

    if (isOverFortuneLimit)
    {
        self.btnTellMeTheFuture.hidden = YES;
        self.lblFortune.text = @"...";

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please Upgrade" message:@"You have hit your fourtune quota for the lite version of the app. Please upgrade to get more fortunes!" delegate:Nil cancelButtonTitle:@"Fine..." otherButtonTitles:Nil, nil];
        
        [alertView show];
    }
    else
    {
        self.btnTellMeTheFuture.hidden = NO;
    }
}

@end