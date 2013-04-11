//
//  CharacterSelectScreen.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CharacterSelectScreen.h"
#import "ButtonImage.h"

@implementation CharacterSelectScreen

@synthesize beginButton;
@synthesize characterButton1;
@synthesize characterButton2;
@synthesize characterButton3;
@synthesize characterButton4;
@synthesize characterButton5;
@synthesize characterButton6;
@synthesize characterButton7;
@synthesize characterButton8;
@synthesize characterButton9;
@synthesize characterButton10;
@synthesize characterButton11;
@synthesize characterButton12;
@synthesize delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        NSString *playerImageFN = [[NSString alloc] initWithString:@"enemiesSheet"];
        NSString *playerString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:playerImageFN ofType:@"png"]];
        UIImage *playerImage = [[UIImage alloc] initWithContentsOfFile:playerString];
        obamaTile = [[ImageTile alloc] initWithFrame:CGRectMake(177,70,150,150)
                                            andImage:@"obama"
                                       andImageFrame:CGRectMake(20,5,110,140)
                                             andName:[Characters nameToString:LaBamba]
                                 andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                     andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                             andText:@""
                                       andTextColour:[Colours getTextColourWithAlpha:1.0]
                                        andTextFrame:CGRectMake(10,150,200,40)];
        obamaTile.delegate = self;
        [self addSubview:obamaTile];
        enemy1 = [[Player alloc] initWithLayer:obamaTile ofType:@"enemy1"];
        enemy1.name = @"La Bamaba";
        
        frenchTile = [[ImageTile alloc] initWithFrame:CGRectMake(177,230,150,150)
                                             andImage:@"french"
                                        andImageFrame:CGRectMake(20,5,110,140)
                                              andName:[Characters nameToString:NicktheShark]
                                  andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                              andText:@""
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10,150,200,40)];
        frenchTile.delegate = self;
        enemy2 = [[Player alloc] initWithLayer:frenchTile ofType:@"enemy2"];
        enemy2.name = @"Nicolas Sarkozy";
        [self addSubview:frenchTile];
        
        kimJongTile = [[ImageTile alloc] initWithFrame:CGRectMake(177,390,150,150)
                                              andImage:@"kim_jong"
                                         andImageFrame:CGRectMake(20,5,110,140)
                                               andName:[Characters nameToString:Un]
                                   andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                       andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                               andText:@""
                                         andTextColour:[Colours getTextColourWithAlpha:1.0]
                                          andTextFrame:CGRectMake(10,150,200,40)];
        kimJongTile.delegate = self;
        [self addSubview:kimJongTile];
        enemy3 = [[Player alloc] initWithLayer:kimJongTile ofType:@"enemy3"];
        enemy3.name = @"Kim Jong Il";

        russiaTile = [[ImageTile alloc] initWithFrame:CGRectMake(177,550,150,150)
                                             andImage:@"russia"
                                        andImageFrame:CGRectMake(20,5,110,140)
                                              andName:[Characters nameToString:Poutine]
                                  andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                              andText:@""
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10,150,200,40)];
        russiaTile.delegate = self;
        [self addSubview:russiaTile];
        enemy4 = [[Player alloc] initWithLayer:russiaTile ofType:@"enemy4"];
        enemy4.name = @"Vlad Putin";

        harperTile = [[ImageTile alloc] initWithFrame:CGRectMake(356,390,150,150)
                                             andImage:@"harper"
                                        andImageFrame:CGRectMake(20, 5, 110, 140)
                                              andName:[Characters nameToString:Stephen]
                                  andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                              andText:@""
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10,150,200,40)];
        harperTile.delegate = self;
        [self addSubview:harperTile];
        enemy5 = [[Player alloc] initWithLayer:harperTile ofType:@"enemy5"];
        enemy5.name = @"Stephan Harper";
        
        merkelTile = [[ImageTile alloc] initWithFrame:CGRectMake(356, 550, 150, 150)
                                             andImage:@"merkel"
                                        andImageFrame:CGRectMake(20, 5, 110, 140)
                                              andName:[Characters nameToString:Merkel]
                                  andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                              andText:@""
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10, 150, 200, 40)];
        merkelTile.delegate = self;
        [self addSubview:merkelTile];
        enemy6 = [[Player alloc] initWithLayer:merkelTile ofType:@"enemy6"];
        enemy6.name = @"Angela Merkel";
        
        chavezTile = [[ImageTile alloc] initWithFrame:CGRectMake(536, 390, 150, 150)
                                             andImage:@"chavez"
                                        andImageFrame:CGRectMake(20, 5, 110, 140)
                                              andName:[Characters nameToString:Chavez]
                                  andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                              andText:@""
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10, 150, 200, 40)];
        chavezTile.delegate = self;
        [self addSubview:chavezTile];
        enemy7 = [[Player alloc] initWithLayer:chavezTile ofType:@"enemy7"];
        enemy7.name = @"Hugo Chavez";
        
        ahmadinejadTile = [[ImageTile alloc] initWithFrame:CGRectMake(536, 550, 150, 150)
                                                  andImage:@"ahmadinejad"
                                             andImageFrame:CGRectMake(20, 5, 110, 140)
                                                   andName:[Characters nameToString:Ahmadinejad]
                                       andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                           andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                                   andText:@""
                                             andTextColour:[Colours getTextColourWithAlpha:1.0]
                                              andTextFrame:CGRectMake(10, 150, 200, 40)];
        ahmadinejadTile.delegate = self;
        [self addSubview:ahmadinejadTile];
        enemy8 = [[Player alloc] initWithLayer:ahmadinejadTile ofType:@"enemy8"];
        enemy8.name = @"Admadinejad";
        
        karziaTile = [[ImageTile alloc] initWithFrame:CGRectMake(706, 70, 150, 150)
                                             andImage:@"karzia"
                                        andImageFrame:CGRectMake(20, 5, 110, 140)
                                              andName:[Characters nameToString:Karzai]
                                  andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                              andText:@""
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10, 150, 200, 40)];
        karziaTile.delegate = self;
        [self addSubview:karziaTile];
        enemy9 = [[Player alloc] initWithLayer:karziaTile ofType:@"enemy9"];
        enemy9.name = @"Karzia";
        
        mugabeTile = [[ImageTile alloc] initWithFrame:CGRectMake(706, 230, 150, 150)
                                             andImage:@"robertmugabe"
                                        andImageFrame:CGRectMake(20, 5, 110, 140)
                                              andName:[Characters nameToString:Mugabe]
                                  andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                      andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                              andText:@""
                                        andTextColour:[Colours getTextColourWithAlpha:1.0]
                                         andTextFrame:CGRectMake(10, 150, 200, 40)];
        mugabeTile.delegate = self;
        [self addSubview:mugabeTile];
        enemy10 = [[Player alloc] initWithLayer:mugabeTile ofType:@"enemy10"];
        enemy10.name = @"Mugabe";
        
        benTile = [[ImageTile alloc] initWithFrame:CGRectMake(706, 390, 150, 150)
                                          andImage:@"ben"
                                     andImageFrame:CGRectMake(20, 5, 110, 140)
                                           andName:[Characters nameToString:Netanyahu]
                               andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                   andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                           andText:@""
                                     andTextColour:[Colours getTextColourWithAlpha:1.0]
                                      andTextFrame:CGRectMake(10, 150, 200, 40)];
        benTile.delegate = self;
        [self addSubview:benTile];
        enemy11 = [[Player alloc] initWithLayer:benTile ofType:@"enemy11"];
        enemy11.name = @"Uncle Ben";
        
        christinaTile = [[ImageTile alloc] initWithFrame:CGRectMake(706, 550, 150, 150)
                                                andImage:@"christina"
                                           andImageFrame:CGRectMake(20, 5, 110, 140)
                                                 andName:[Characters nameToString:Cristine]
                                     andBackGroundColour:[Colours getCharacterBackgroundColor:1.0]
                                         andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                                 andText:@""
                                           andTextColour:[Colours getTextColourWithAlpha:1.0]
                                            andTextFrame:CGRectMake(10, 150, 200, 40)];
        christinaTile.delegate = self;
        [self addSubview:christinaTile];
        enemy12 = [[Player alloc] initWithLayer:christinaTile ofType:@"enemy12"];
        enemy12.name = @"Christina";

        [playerImageFN release];
        [playerString release];
        [playerImage release];
        
        backTile = [[LabelTile alloc] initWithFrame:CGRectMake(900, 15, 100, 80)
                                            andText:@"Back"
                                            andName:@"Back"
                                        andBGColour:[Colours getButtonColourWithAlpha:1.0]
                                    andSelectColour:[Colours getTextColourWithAlpha:1.0]
                                      andTextColour:[Colours getTextColourWithAlpha:1.0]
                                       andTextFrame:CGRectMake(10,50,100,25)];
        backTile.delegate = self;
        [self addSubview:backTile];
    }
    return self;
}

-(void)tilePressed:(NSString*)buttonName
{
    if ([buttonName isEqualToString:@"Back"]) {
        [delegate closeSelectScreen];
    } else {
        [self checkNumSelected];
    }
}

-(void)setUpCharacterSelectedScreen
{
    beginButton.enabled = NO;
    characterButton5.enabled = NO;
    characterButton6.enabled = NO;
    characterButton7.enabled = NO;
    characterButton8.enabled = NO;
    characterButton9.enabled = NO;
    characterButton10.enabled = NO;
    characterButton11.enabled = NO;
    characterButton12.enabled = NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(IBAction)touchBeginButton:(id)sender
{
    NSMutableArray *opponents = [[NSMutableArray alloc] initWithCapacity:4];
    int locationCounter = 1;
    if (obamaTile.selected) {
        enemy1.location = ++locationCounter;
        [opponents addObject:enemy1];
    }
    if (frenchTile.selected) {
        enemy2.location = ++locationCounter;
        [opponents addObject:enemy2];
    }
    if (kimJongTile.selected) {
        enemy3.location = ++locationCounter;
        [opponents addObject:enemy3];
    }
    if (russiaTile.selected) {
        enemy4.location = ++locationCounter;
        [opponents addObject:enemy4];
    }
    if (harperTile.selected) {
        enemy5.location = ++locationCounter;
        [opponents addObject:enemy5];
    }
    if (merkelTile.selected) {
        enemy6.location = ++locationCounter;
        [opponents addObject:enemy6];
    }
    if (chavezTile.selected) {
        enemy7.location = ++locationCounter;
        [opponents addObject:enemy7];
    }
    if (ahmadinejadTile.selected) {
        enemy8.location = ++locationCounter;
        [opponents addObject:enemy8];
    }
    if (karziaTile.selected) {
        enemy9.location = ++locationCounter;
        [opponents addObject:enemy9];
    }
    if (mugabeTile.selected) {
        enemy10.location = ++locationCounter;
        [opponents addObject:enemy10];
    }
    if (benTile.selected) {
        enemy11.location = ++locationCounter;
        [opponents addObject:enemy11];
    }
    if (christinaTile.selected) {
        enemy12.location = ++locationCounter;
        [opponents addObject:enemy12];
    }
//    NSArray *opponents = [[NSArray alloc] initWithObjects:enemy1, enemy2, enemy3, enemy4, nil];
    [delegate beginGameWithPlayers:opponents];
    [opponents release];
}

-(BOOL)checkNumSelected
{
    int counter = 0;
    if (obamaTile.selected) counter++;
    if (frenchTile.selected) counter++;
    if (kimJongTile.selected) counter++;
    if (russiaTile.selected) counter++;
    if (harperTile.selected) counter++;
    if (merkelTile.selected) counter++;
    if (chavezTile.selected) counter++;
    if (ahmadinejadTile.selected) counter++;
    if (karziaTile.selected) counter++;
    if (mugabeTile.selected) counter++;
    if (benTile.selected) counter++;
    if (christinaTile.selected) counter++;
    if (counter == 4) {
        beginButton.enabled = YES;
        return YES;
    } else
        beginButton.enabled = NO;
    return NO;
}

-(IBAction)touchCharacterButton:(id)sender
{
    // This is not used anymore.
    if ([self checkNumSelected]) return;
    if ([(UIButton *)sender isSelected]) {
        [(UIButton *)sender setSelected:NO];
    } else {
        [(UIButton *)sender setSelected:YES];
    }
    [self checkNumSelected];
}

-(void)dealloc
{
    [beginButton release]; beginButton = nil;
    [obamaTile release]; [kimJongTile release]; [russiaTile release]; [frenchTile release];
    [harperTile release]; [merkelTile release]; [chavezTile release]; [ahmadinejadTile release];
    [karziaTile release]; [mugabeTile release]; [benTile release]; [christinaTile release];
    [characterButton1 release]; characterButton1 = nil;
    [characterButton2 release]; characterButton2 = nil;
    [characterButton3 release]; characterButton3 = nil;
    [characterButton4 release]; characterButton4 = nil;
    [characterButton5 release]; characterButton5 = nil;
    [characterButton6 release]; characterButton6 = nil;
    [characterButton7 release]; characterButton7 = nil;
    [characterButton8 release]; characterButton8 = nil;
    [characterButton9 release]; characterButton9 = nil;
    [characterButton10 release]; characterButton10 = nil;
    [characterButton11 release]; characterButton11 = nil;
    [characterButton12 release]; characterButton12 = nil;
    delegate = nil;
    [super dealloc];
}

@end
