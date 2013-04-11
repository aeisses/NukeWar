//
//  com_ratheroddcomputing_NukeWarViewController.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntroScreen.h"
#import "MenuScreen.h"
#import "CharacterSelectScreen.h"
#import "MainGameViewController.h"
#import "GameOverScreen.h"

@interface com_ratheroddcomputing_NukeWarViewController : UIViewController <MenuScreenDelegate,CharacterSelectScreenDelegate,MainGameViewControllerDelegate,GameOverScreenDelegate>
{
    IntroScreen *myIntroScreen;
    MenuScreen *myMenuScreen;
    CharacterSelectScreen *myCharacterSelectScreen;
    MainGameViewController *myMainGameViewController;
    GameOverScreen *myGameOverScreen;
}

@property (retain, nonatomic) IntroScreen *myIntroScreen;
@property (retain, nonatomic) MenuScreen *myMenuScreen;
@property (retain, nonatomic) CharacterSelectScreen *myCharacterSelectScreen;
@property (retain, nonatomic) MainGameViewController *myMainGameViewController;
@property (retain, nonatomic) GameOverScreen *myGameOverScreen;

@end
