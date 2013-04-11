//
//  com_ratheroddcomputing_NukeWarViewController.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "com_ratheroddcomputing_NukeWarViewController.h"

@implementation com_ratheroddcomputing_NukeWarViewController

@synthesize myIntroScreen;
@synthesize myMenuScreen;
@synthesize myCharacterSelectScreen;
@synthesize myMainGameViewController;
@synthesize myGameOverScreen;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - CharacterSelectScreen delegate methods
-(void)beginGameWithPlayers:(NSArray *)players
{
//    dispatch_queue_t setupQueue = dispatch_queue_create("setup command center", NULL);
//    dispatch_async(setupQueue, ^{
        [myMainGameViewController setPlayers:players];
//    });
    [self presentModalViewController:myMainGameViewController animated:YES];
}

-(void)closeSelectScreen
{
    [myCharacterSelectScreen removeFromSuperview];
    [self.view addSubview:myMenuScreen];
}

#pragma mark - MenuScreen delegate methods
-(void)playButtonPressed
{
    [myMenuScreen removeFromSuperview];
    [self.view addSubview:myCharacterSelectScreen];
}

#pragma mark - MainGameViewController delegate methods
-(void)gameOver:(NSString *)PlayerName withScore:(int)Score
{
    [myMainGameViewController dismissModalViewControllerAnimated:NO];
    [myGameOverScreen setResult:PlayerName withScore:Score];
    [self.view addSubview:myGameOverScreen];
}

#pragma mark - GameOverScreen
-(void)playAgain
{
    [myGameOverScreen removeFromSuperview];
    [myCharacterSelectScreen release];
    [self loadCharacterScreen];
    [self.view addSubview:myCharacterSelectScreen];
    [myMainGameViewController release];
    [self loadMainGameViewController];
}

-(void)loadCharacterScreen
{
    NSArray *nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"CharacterSelectScreen" owner:self options:nil]];
    myCharacterSelectScreen = [[nibObjects objectAtIndex:0] retain];
    myCharacterSelectScreen.delegate = self;
    [myCharacterSelectScreen setUpCharacterSelectedScreen];
    [nibObjects release];
}

-(void)loadMainGameViewController
{
    myMainGameViewController = [[MainGameViewController alloc] initWithNibName:@"MainGameViewController" bundle:nil];
    myMainGameViewController.delegate = self;
}

#pragma mark - View lifecycle

-(void)loadAllInformation
{
    NSArray *nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"MenuScreen" owner:self options:nil]];
    myMenuScreen = [[nibObjects objectAtIndex:0] retain];
    myMenuScreen.delegate = self;
    myMenuScreen.backGroundImage.alpha = 0.0;
    myMenuScreen.playButton.hidden = YES;
    myMenuScreen.titleLabel.textColor = [Colours getTextColourWithAlpha:1.0];
    myMenuScreen.titleLabel.frame = CGRectMake(143,-181,738,181);
    [self.view addSubview:myMenuScreen];
    [UIView animateWithDuration:5 animations:^{
        myMenuScreen.backGroundImage.alpha = 1.0;
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1 animations:^{
            myMenuScreen.titleLabel.frame = CGRectMake(143,587,738,181);
        } completion:^(BOOL finished) {
//        myMenuScreen.playButton.hidden = NO;
            myMenuScreen.tileButton.hidden = NO;
            myMenuScreen.optionsButton.hidden = NO;
            myMenuScreen.creditButton.hidden = NO;
            [myMenuScreen startHeadAnimation];
        }];
    }];
    [nibObjects release];
    
    [self loadCharacterScreen];
    
    nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"GameOver" owner:self options:nil]];
    myGameOverScreen = [[nibObjects objectAtIndex:0] retain];
    myGameOverScreen.delegate = self;
    [nibObjects release];
    
    [self loadMainGameViewController];
//    nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"MainGameViewController" owner:self options:nil]];
//    myMainGameViewController = [[MainGameViewController alloc] initWithNibName:@"MainGameViewController" bundle:nil];
//    myMainGameViewController.delegate = self;
///    [nibObjects release];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.view addSubview:myMenuScreen];
//        [myIntroScreen clearLabels];
//    });
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    dispatch_async(dispatch_get_main_queue(), ^{
        // Do any additional setup after loading the view, typically from a nib.
//        NSArray *nibObjects = [[NSArray alloc] initWithArray:[[NSBundle mainBundle] loadNibNamed:@"IntroScreen" owner:self options:nil]];
//        myIntroScreen = [[nibObjects objectAtIndex:0] retain];
//        [nibObjects release];
//        self.view = myIntroScreen;
//    });
    
//    dispatch_queue_t setupQueue = dispatch_queue_create("setup display", NULL);
//    dispatch_async(setupQueue, ^{
        [self loadAllInformation];
//    });
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(void)dealloc
{
    [myCharacterSelectScreen release]; myCharacterSelectScreen = nil;
    [myMenuScreen release]; myMenuScreen = nil;
    [myIntroScreen release]; myIntroScreen = nil;
    [super dealloc];
}
@end
