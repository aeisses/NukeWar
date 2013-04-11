//
//  Tile.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-03.
//
//

#import "Tile.h"

@implementation Tile

@synthesize delegate, selected, enabled, selectColour, backgroundColour;

-(id)initWithFrame:(CGRect)frame andName:(NSString*)name andBGColour:(UIColor *)bgColour andSelectColour:(UIColor *)selColour
{
    if (self = [super initWithFrame:frame])
    {
        enabled = YES;
        selected = NO;
        isCheckButton = NO;
        self.selectColour = [selColour retain];
        self.backgroundColour = [bgColour retain];
        self.name = [[NSString alloc] initWithString:name];
        [self.layer setBackgroundColor:[self.backgroundColour CGColor]];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!enabled) return;
    self.layer.borderWidth = (float)3;
    self.layer.cornerRadius = (float)1;
    self.layer.borderColor = [self.selectColour CGColor];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!enabled) return;
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    touchPoint.x = self.frame.origin.x + touchPoint.x;
    touchPoint.y = self.frame.origin.y + touchPoint.y;
    if (CGRectContainsPoint(self.frame, touchPoint)) {
        if (isCheckButton && !selected) {
            selected = YES;
            [delegate tilePressed:self.name];
        } else {
            self.layer.borderWidth = (float)0;
            self.layer.cornerRadius = (float)0;
            selected = NO;
            [delegate tilePressed:self.name];
        }
    } else {
        self.layer.borderWidth = (float)0;
        self.layer.cornerRadius = (float)0;
        selected = NO;
    }
}

-(void)dealloc
{
    [self.name release];
    [self.selectColour release];
    [self.backgroundColour release];
    delegate = nil;
    [super dealloc];
}

@end
