//
//  GameOverScreen.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-03.
//
//

#import "GameOverScreen.h"

@implementation GameOverScreen

@synthesize delegate, playAgainButton, scoreLabel, resultLabel;

-(void)setResult:(NSString *)player withScore:(int)score
{
    if ([player isEqualToString:@"you"]) {
        resultLabel.text = @"You WON with a score of:";
        scoreLabel.text = [NSString stringWithFormat:@"%i",score];
        scoreLabel.hidden = NO;
    } else {
        resultLabel.text = @"You LOST!";
        scoreLabel.hidden = YES;
    }
}

-(IBAction)touchPlayAgainButton:(id)sender
{
    [delegate playAgain];
}

-(void)dealloc
{
    [super dealloc];
    [playAgainButton release]; playAgainButton = nil;
    [scoreLabel release]; scoreLabel = nil;
    [resultLabel release]; resultLabel = nil;
}

@end
