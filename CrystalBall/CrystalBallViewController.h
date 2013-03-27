//
//  CrystalBallViewController.h
//  CrystalBall
//
//  Created by Mike Berlin on 3/26/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrystalBallViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblFortune;
@property (weak, nonatomic) IBOutlet UIButton *btnTellMeTheFuture;

- (IBAction)btnNextFuture:(id)sender;

@end