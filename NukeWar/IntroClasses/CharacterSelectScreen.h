//
//  CharacterSelectScreen.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "LabelTile.h"
#import "ImageTile.h"
#import "Characters.h"

#define playerImageWidthCharSS 150
#define playerImageHeightCharSS 150

@protocol CharacterSelectScreenDelegate <NSObject>
-(void)beginGameWithPlayers:(NSArray *)players;
-(void)closeSelectScreen;
@end

@interface CharacterSelectScreen : UIView <TileDelegate>
{
    IBOutlet UIButton *beginButton;
    IBOutlet UIButton *characterButton1;
    IBOutlet UIButton *characterButton2;
    IBOutlet UIButton *characterButton3;
    IBOutlet UIButton *characterButton4;
    IBOutlet UIButton *characterButton5;
    IBOutlet UIButton *characterButton6;
    IBOutlet UIButton *characterButton7;
    IBOutlet UIButton *characterButton8;
    IBOutlet UIButton *characterButton9;
    IBOutlet UIButton *characterButton10;
    IBOutlet UIButton *characterButton11;
    IBOutlet UIButton *characterButton12;
    
    Player *enemy1;
    Player *enemy2;
    Player *enemy3;
    Player *enemy4;
    Player *enemy5;
    Player *enemy6;
    Player *enemy7;
    Player *enemy8;
    Player *enemy9;
    Player *enemy10;
    Player *enemy11;
    Player *enemy12;

    LabelTile *backTile;
    ImageTile *obamaTile;
    ImageTile *kimJongTile;
    ImageTile *russiaTile;
    ImageTile *frenchTile;
    ImageTile *harperTile;
    ImageTile *merkelTile;
    ImageTile *chavezTile;
    ImageTile *ahmadinejadTile;
    ImageTile *karziaTile;
    ImageTile *mugabeTile;
    ImageTile *benTile;
    ImageTile *christinaTile;
    
    id <CharacterSelectScreenDelegate> delegate;
}

@property (retain, nonatomic) IBOutlet UIButton *beginButton;
@property (retain, nonatomic) IBOutlet UIButton *characterButton1;
@property (retain, nonatomic) IBOutlet UIButton *characterButton2;
@property (retain, nonatomic) IBOutlet UIButton *characterButton3;
@property (retain, nonatomic) IBOutlet UIButton *characterButton4;
@property (retain, nonatomic) IBOutlet UIButton *characterButton5;
@property (retain, nonatomic) IBOutlet UIButton *characterButton6;
@property (retain, nonatomic) IBOutlet UIButton *characterButton7;
@property (retain, nonatomic) IBOutlet UIButton *characterButton8;
@property (retain, nonatomic) IBOutlet UIButton *characterButton9;
@property (retain, nonatomic) IBOutlet UIButton *characterButton10;
@property (retain, nonatomic) IBOutlet UIButton *characterButton11;
@property (retain, nonatomic) IBOutlet UIButton *characterButton12;
@property (retain, nonatomic) id <CharacterSelectScreenDelegate> delegate;

-(void)setUpCharacterSelectedScreen;
-(IBAction)touchBeginButton:(id)sender;
-(IBAction)touchCharacterButton:(id)sender;

@end