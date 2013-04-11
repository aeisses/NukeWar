//
//  IntroScreen.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroScreen : UIView
{
    IBOutlet UILabel *lableOne;
    IBOutlet UILabel *lableTwo;
}

@property (retain, nonatomic) IBOutlet UILabel *labelOne;
@property (retain, nonatomic) IBOutlet UILabel *labelTwo;

-(void)clearLabels;

@end