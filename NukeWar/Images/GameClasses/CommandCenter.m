//
//  CommandCenter.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CommandCenter.h"

@implementation CommandCenter

@synthesize delegate;
@synthesize missile10MegTonImage;
@synthesize missile20MegTonImage;
@synthesize missile50MegTonImage;
@synthesize missile100MegTonImage;
@synthesize warhead10MegTonImage;
@synthesize warhead20MegTonImage;
@synthesize warhead50MegTonImage;
@synthesize warhead100MegTonImage;
@synthesize jetSmallImage;
@synthesize jetLargeImage;
@synthesize defenseSmallImage;
@synthesize defenseLargeImage;
@synthesize missile10MegTonButton;
@synthesize missile20MegTonButton;
@synthesize missile50MegTonButton;
@synthesize missile100MegTonButton;
@synthesize warhead10MegTonButton;
@synthesize warhead20MegTonButton;
@synthesize warhead50MegTonButton;
@synthesize warhead100MegTonButton;
@synthesize jetSmallButton;
@synthesize jetLargeButton;
@synthesize defenseSmallButton;
@synthesize defenseLargeButton;
@synthesize commandCenterTextView;
@synthesize buildButton;
@synthesize propagandaButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setupCommandCenterWithOpponents:(NSArray *)_opponents andPlayer:(Player *)_player
{
    player = [_player retain];
    opponents = [[NSArray alloc] initWithArray:_opponents];
    
    NSString *lightImageFN = [[NSString alloc] initWithString:@"lightSheet"];
    NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:lightImageFN ofType:@"png"]];
    UIImage *lightImage = [[UIImage alloc] initWithContentsOfFile:imageString];
    [imageString release];
    missile10MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 252, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:missile10MegTonImage.lightImage];
    missile20MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 282, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:missile20MegTonImage.lightImage];
    missile50MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 312, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:missile50MegTonImage.lightImage];
    missile100MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 342, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:missile100MegTonImage.lightImage];
    warhead10MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 400, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:warhead10MegTonImage.lightImage];
    warhead20MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 430, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:warhead20MegTonImage.lightImage];
    warhead50MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 460, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:warhead50MegTonImage.lightImage];
    warhead100MegTonImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(148, 490, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:warhead100MegTonImage.lightImage];
    jetSmallImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(852, 252, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:jetSmallImage.lightImage];
    jetLargeImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(852, 342, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:jetLargeImage.lightImage];
    defenseSmallImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(852, 400, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:defenseSmallImage.lightImage];
    defenseLargeImage = [[Light alloc] initWithFile:lightImageFN andImage:lightImage andFrame:CGRectMake(852, 490, lightImageWidth, lightImageHeight)];
    [self.layer addSublayer:defenseLargeImage.lightImage];
    [lightImageFN release];
    [lightImage release];
    
    NSString *itemImageFN = [[NSString alloc] initWithString:@"itemsSheet"];
    NSString *itemString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:itemImageFN ofType:@"png"]];
    UIImage *itemImage = [[UIImage alloc] initWithContentsOfFile:itemString];
    missileImage = [[ItemImage alloc] initWithFile:itemImageFN andImage:itemImage andFrame:CGRectMake(15, 245, itemImageWidth, itemImageHeight) ofType:@"missiles"];
    [self.layer addSublayer:missileImage.itemImage];
    warheadImage = [[ItemImage alloc] initWithFile:itemImageFN andImage:itemImage andFrame:CGRectMake(15, 393, itemImageWidth, itemImageHeight) ofType:@"warHeads"];
    [self.layer addSublayer:warheadImage.itemImage];
    jetImage = [[ItemImage alloc] initWithFile:itemImageFN andImage:itemImage andFrame:CGRectMake(879, 245, itemImageWidth, itemImageHeight) ofType:@"jets"];
    [self.layer addSublayer:jetImage.itemImage];
    defenseImage= [[ItemImage alloc] initWithFile:itemImageFN andImage:itemImage andFrame:CGRectMake(879, 393, itemImageWidth, itemImageHeight) ofType:@"defense"];
    [self.layer addSublayer:defenseImage.itemImage];
    [itemImageFN release];
    [itemString release];
    [itemImage release];
    
    [((Player *)[opponents objectAtIndex:0]) setFrame:CGRectMake(15, 15, playerImageWidth, playerImageHeight)];
    ((Player *)[opponents objectAtIndex:0]).imageView.label.text = @"I think we should all talk #friends";
    [self insertSubview:((Player *)[opponents objectAtIndex:0]).imageView atIndex:1];
    [((Player *)[opponents objectAtIndex:1]) setFrame:CGRectMake(789, 15, playerImageWidth, playerImageHeight)];
    [self insertSubview:((Player *)[opponents objectAtIndex:1]).imageView atIndex:1];
    ((Player *)[opponents objectAtIndex:2]).imageView.label.text = @"@obama DEATH to America!";
    [((Player *)[opponents objectAtIndex:2]) setFrame:CGRectMake(15, 532, playerImageWidth, playerImageHeight)];
    [self insertSubview:((Player *)[opponents objectAtIndex:2]).imageView atIndex:1];
    [((Player *)[opponents objectAtIndex:3]) setFrame:CGRectMake(789, 532, playerImageWidth, playerImageHeight)];
    [self insertSubview:((Player *)[opponents objectAtIndex:3]).imageView atIndex:1];

    [self.layer insertSublayer:[player getRelationShipToPlayer:((Player *)[opponents objectAtIndex:0]).type].faceImage above:((Player *)[opponents objectAtIndex:0]).playerImage];
    [self.layer insertSublayer:[player getRelationShipToPlayer:((Player *)[opponents objectAtIndex:1]).type].faceImage above:((Player *)[opponents objectAtIndex:1]).playerImage];
    [self.layer insertSublayer:[player getRelationShipToPlayer:((Player *)[opponents objectAtIndex:2]).type].faceImage above:((Player *)[opponents objectAtIndex:2]).playerImage];
    [self.layer insertSublayer:[player getRelationShipToPlayer:((Player *)[opponents objectAtIndex:3]).type].faceImage above:((Player *)[opponents objectAtIndex:3]).playerImage];
}

-(void)update
{
    [missile10MegTonImage update];
    [missile20MegTonImage update];
    [missile50MegTonImage update];
    [missile100MegTonImage update];
    [warhead10MegTonImage update];
    [warhead20MegTonImage update];
    [warhead50MegTonImage update];
    [warhead100MegTonImage update];
    [jetSmallImage update];
    [jetLargeImage update];
    [defenseSmallImage update];
    [defenseLargeImage update];
    missile10MegTonButton.enabled = missile10MegTonImage.selected ? YES : NO;
    missile20MegTonButton.enabled = missile20MegTonImage.selected ? YES : NO;
    missile50MegTonButton.enabled = missile50MegTonImage.selected ? YES : NO;
    missile100MegTonButton.enabled = missile100MegTonImage.selected ? YES : NO;
    warhead10MegTonButton.enabled = warhead10MegTonImage.selected ? YES : NO;
    warhead20MegTonButton.enabled = warhead20MegTonImage.selected ? YES : NO;
    warhead50MegTonButton.enabled = warhead50MegTonImage.selected ? YES : NO;
    warhead100MegTonButton.enabled = warhead100MegTonImage.selected ? YES : NO;
    jetSmallButton.enabled = jetSmallImage.selected ? YES : NO;
    jetLargeButton.enabled = jetLargeImage.selected ? YES : NO;
    defenseSmallButton.enabled = defenseSmallImage.selected ? YES : NO;
    defenseLargeButton.enabled = defenseLargeImage.selected ? YES : NO;
}

-(void)resetAllButtons
{
    missile10MegTonButton.enabled = NO;
    missile20MegTonButton.enabled = NO;
    missile50MegTonButton.enabled = NO;
    missile100MegTonButton.enabled = NO;
    warhead10MegTonButton.enabled = NO;
    warhead20MegTonButton.enabled = NO;
    warhead50MegTonButton.enabled = NO;
    warhead100MegTonButton.enabled = NO;
    jetSmallButton.enabled = NO;
    jetLargeButton.enabled = NO;
    defenseSmallButton.enabled = NO;
    defenseLargeButton.enabled = NO;
    missile10MegTonButton.selected = NO;
    missile20MegTonButton.selected = NO;
    missile50MegTonButton.selected = NO;
    missile100MegTonButton.selected = NO;
    warhead10MegTonButton.selected = NO;
    warhead20MegTonButton.selected = NO;
    warhead50MegTonButton.selected = NO;
    warhead100MegTonButton.selected = NO;
    jetSmallButton.selected = NO;
    jetLargeButton.selected = NO;
    defenseSmallButton.selected = NO;
    defenseLargeButton.selected = NO;
    missile10MegTonImage.selected = NO;
    missile20MegTonImage.selected = NO;
    missile50MegTonImage.selected = NO;
    missile100MegTonImage.selected = NO;
    warhead10MegTonImage.selected = NO;
    warhead20MegTonImage.selected = NO;
    warhead50MegTonImage.selected = NO;
    warhead100MegTonImage.selected = NO;
    jetSmallImage.selected = NO;
    jetLargeImage.selected = NO;
    defenseSmallImage.selected = NO;
    defenseLargeImage.selected = NO;
    buildButton.selected = NO;
    propagandaButton.selected = NO;
}

-(IBAction)touchFaceButton:(id)sender
{
    switch (((UIButton *)sender).tag) {
        case 11:
            [player increaseRelationToPlayer:((Player *)[opponents objectAtIndex:0]).type];
            break;
        case 12:
            [player increaseRelationToPlayer:((Player *)[opponents objectAtIndex:1]).type];
            break;
        case 13:
            [player increaseRelationToPlayer:((Player *)[opponents objectAtIndex:2]).type];
            break;
        case 14:
            [player increaseRelationToPlayer:((Player *)[opponents objectAtIndex:3]).type];
            break;
    }
}

-(IBAction)touchEnemyButton:(id)sender
{
    [delegate enemyButtonPressed:((UIButton *)sender).tag];
}

-(IBAction)touchMissileButton:(id)sender
{
    switch (((UIButton *)sender).tag) {
        case 21:
            missile10MegTonButton.selected = missile10MegTonButton.selected ? NO : YES;
            missile20MegTonButton.selected = NO;
            missile50MegTonButton.selected = NO;
            missile100MegTonButton.selected = NO;
            break;
        case 22:
            missile10MegTonButton.selected = NO;
            missile20MegTonButton.selected = missile20MegTonButton.selected ? NO : YES;
            missile50MegTonButton.selected = NO;
            missile100MegTonButton.selected = NO;
            break;
        case 23:
            missile10MegTonButton.selected = NO;
            missile20MegTonButton.selected = NO;
            missile50MegTonButton.selected = missile50MegTonButton.selected ? NO : YES;
            missile100MegTonButton.selected = NO;
            break;
        case 24:
            missile10MegTonButton.selected = NO;
            missile20MegTonButton.selected = NO;
            missile50MegTonButton.selected = NO;
            missile100MegTonButton.selected = missile100MegTonButton.selected ? NO : YES;
            break;
    }
    warhead10MegTonButton.selected = NO;
    warhead20MegTonButton.selected = NO;
    warhead50MegTonButton.selected = NO;
    warhead100MegTonButton.selected = NO;
    jetSmallButton.selected = NO;
    jetLargeButton.selected = NO;
    defenseSmallButton.selected = NO;
    defenseLargeButton.selected = NO;
    buildButton.selected = NO;
    propagandaButton.selected = NO;
}

-(IBAction)touchWarHeadButton:(id)sender
{
    if (!player.isMisselReady && !player.isJetScrambled ) {
        commandCenterTextView.text = @"You need to select a delivery method, either missels or jets.";
        return;
    }
    switch (((UIButton *)sender).tag) {
        case 31:
        {
            if (player.isMisselReady && player.currentMisselLoadRemaining < 10) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the missel on the launch pad.";
                return;
            }
            if (player.isJetScrambled && player.currentJetLoadRemaining < 10) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the fueled up jet.";
                return;
            }
            warhead10MegTonButton.selected = warhead10MegTonButton.selected ? NO : YES;
            warhead20MegTonButton.selected = NO;
            warhead50MegTonButton.selected = NO;
            warhead100MegTonButton.selected = NO;
        }
            break;
        case 32:
        {
            if (player.isMisselReady && player.currentMisselLoadRemaining < 20) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the missel on the launch pad.";
                return;
            }
            if (player.isJetScrambled && player.currentJetLoadRemaining < 20) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the fueled up jet.";
                return;
            }
            warhead10MegTonButton.selected = NO;
            warhead20MegTonButton.selected = warhead20MegTonButton.selected ? NO : YES;
            warhead50MegTonButton.selected = NO;
            warhead100MegTonButton.selected = NO;
        }
            break;
        case 33:
        {
            if (player.isMisselReady && player.currentMisselLoadRemaining < 50) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the missel on the launch pad.";
                return;
            }
            if (player.isJetScrambled && player.currentJetLoadRemaining < 50) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the fueled up jet.";
                return;
            }
            warhead10MegTonButton.selected = NO;
            warhead20MegTonButton.selected = NO;
            warhead50MegTonButton.selected = warhead50MegTonButton.selected ? NO : YES;
            warhead100MegTonButton.selected = NO;
        }
            break;
        case 34:
        {
            if (player.isMisselReady && player.currentMisselLoadRemaining < 100) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the missel on the launch pad.";
                return;
            }
            if (player.isJetScrambled && player.currentJetLoadRemaining < 100) {
                commandCenterTextView.text = @"There is not enough capacity left on the on the fueled up jet.";
                return;
            }
            warhead10MegTonButton.selected = NO;
            warhead20MegTonButton.selected = NO;
            warhead50MegTonButton.selected = NO;
            warhead100MegTonButton.selected = warhead100MegTonButton.selected ? NO : YES;
        }
            break;
    }
    missile10MegTonButton.selected = NO;
    missile20MegTonButton.selected = NO;
    missile50MegTonButton.selected = NO;
    missile100MegTonButton.selected = NO;
    jetSmallButton.selected = NO;
    jetLargeButton.selected = NO;
    defenseSmallButton.selected = NO;
    defenseLargeButton.selected = NO;
    buildButton.selected = NO;
    propagandaButton.selected = NO;
}

-(IBAction)touchJetsButton:(id)sender
{
    switch (((UIButton *)sender).tag) {
        case 41:
            jetSmallButton.selected = jetSmallButton.selected ? NO : YES;
            jetLargeButton.selected = NO;
            break;
        case 42:
            jetSmallButton.selected = NO;
            jetLargeButton.selected = jetLargeButton.selected ? NO : YES;
            break;
    }
    missile10MegTonButton.selected = NO;
    missile20MegTonButton.selected = NO;
    missile50MegTonButton.selected = NO;
    missile100MegTonButton.selected = NO;
    warhead10MegTonButton.selected = NO;
    warhead20MegTonButton.selected = NO;
    warhead50MegTonButton.selected = NO;
    warhead100MegTonButton.selected = NO;
    defenseSmallButton.selected = NO;
    defenseLargeButton.selected = NO;
    buildButton.selected = NO;
    propagandaButton.selected = NO;
}

-(IBAction)touchDefenseButton:(id)sender
{
    switch (((UIButton *)sender).tag) {
        case 51:
            defenseSmallButton.selected = defenseSmallButton.selected ? NO : YES;
            defenseLargeButton.selected = NO;
            break;
        case 52:
            defenseSmallButton.selected = NO;
            defenseLargeButton.selected = defenseLargeButton.selected ? NO : YES;
            break;
    }
    missile10MegTonButton.selected = NO;
    missile20MegTonButton.selected = NO;
    missile50MegTonButton.selected = NO;
    missile100MegTonButton.selected = NO;
    warhead10MegTonButton.selected = NO;
    warhead20MegTonButton.selected = NO;
    warhead50MegTonButton.selected = NO;
    warhead100MegTonButton.selected = NO;
    jetSmallButton.selected = NO;
    jetLargeButton.selected = NO;
    buildButton.selected = NO;
    propagandaButton.selected = NO;
}

-(IBAction)touchBuildButton:(id)sender
{
    buildButton.selected = buildButton.selected ? NO : YES;
    propagandaButton.selected = NO;
    missile10MegTonButton.selected = NO;
    missile20MegTonButton.selected = NO;
    missile50MegTonButton.selected = NO;
    missile100MegTonButton.selected = NO;
    warhead10MegTonButton.selected = NO;
    warhead20MegTonButton.selected = NO;
    warhead50MegTonButton.selected = NO;
    warhead100MegTonButton.selected = NO;
    jetSmallButton.selected = NO;
    jetLargeButton.selected = NO;
    defenseSmallButton.selected = NO;
    defenseLargeButton.selected = NO;
}

-(IBAction)touchPropagandaButton:(id)sender
{
    propagandaButton.selected = propagandaButton.selected ? NO : YES;
    buildButton.selected = NO;
    missile10MegTonButton.selected = NO;
    missile20MegTonButton.selected = NO;
    missile50MegTonButton.selected = NO;
    missile100MegTonButton.selected = NO;
    warhead10MegTonButton.selected = NO;
    warhead20MegTonButton.selected = NO;
    warhead50MegTonButton.selected = NO;
    warhead100MegTonButton.selected = NO;
    jetSmallButton.selected = NO;
    jetLargeButton.selected = NO;
    defenseSmallButton.selected = NO;
    defenseLargeButton.selected = NO;
}

-(IBAction)touchNukeWarButton:(id)sender
{
    [delegate nukeWarButtonPressed];
}

-(void)dealloc
{
    delegate = nil;
    [missileImage release]; missileImage = nil;
    [warheadImage release]; warheadImage = nil;
    [jetImage release]; jetImage = nil;
    [defenseImage release]; defenseImage = nil;
    [enemyOneFace release]; enemyOneFace = nil;
    [enemyTwoFace release]; enemyTwoFace = nil;
    [enemyThreeFace release]; enemyThreeFace = nil;
    [enemyFourFace release]; enemyFourFace = nil;
    [enemyOneImage release]; enemyOneImage = nil;
    [enemyTwoImage release]; enemyTwoImage = nil;
    [enemyThreeImage release]; enemyThreeImage = nil;
    [enemyFourImage release]; enemyFourImage = nil;
    [missile10MegTonImage release]; missile10MegTonImage = nil;
    [missile20MegTonImage release]; missile20MegTonImage = nil;
    [missile50MegTonImage release]; missile50MegTonImage = nil;
    [missile100MegTonImage release]; missile100MegTonImage = nil;
    [warhead10MegTonImage release]; warhead100MegTonImage = nil;
    [warhead20MegTonImage release]; warhead20MegTonImage = nil;
    [warhead50MegTonImage release]; warhead50MegTonImage = nil;
    [warhead100MegTonImage release]; warhead100MegTonImage = nil;
    [jetSmallImage release]; jetSmallImage = nil;
    [jetLargeImage release]; jetLargeImage = nil;
    [defenseSmallImage release]; defenseSmallImage = nil;
    [defenseLargeImage release]; defenseLargeImage = nil;
    [missile10MegTonButton release]; missile100MegTonButton = nil;
    [missile20MegTonButton release]; missile20MegTonButton = nil;
    [missile50MegTonButton release]; missile50MegTonButton = nil;
    [missile100MegTonButton release]; missile100MegTonButton = nil;
    [warhead10MegTonButton release]; warhead10MegTonButton = nil;
    [warhead20MegTonButton release]; warhead20MegTonButton = nil;
    [warhead50MegTonButton release]; warhead50MegTonButton = nil;
    [warhead100MegTonButton release]; warhead100MegTonButton = nil;
    [jetSmallButton release]; jetSmallButton = nil;
    [jetLargeButton release]; jetLargeButton = nil;
    [defenseSmallButton release]; defenseSmallButton = nil;
    [defenseLargeButton release]; defenseLargeButton = nil;
    [commandCenterTextView release]; commandCenterTextView = nil;
    [propagandaButton release]; propagandaButton = nil;
    [buildButton release]; buildButton = nil;
    [player release]; player = nil;
    [opponents release]; opponents = nil;
    [super dealloc];
}

@end
