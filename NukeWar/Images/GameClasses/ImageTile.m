//
//  ImageTile.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-06.
//
//

#import "ImageTile.h"

@implementation ImageTile

@synthesize imageLayer;

- (id)initWithFrame:(CGRect)frame andImage:(NSString *)fileName andImageFrame:(CGRect)imageFrame andName:(NSString *)name andBackGroundColour:(UIColor *)bgColour andSelectColour:(UIColor *)selColour andText:(NSString *)text andTextColour:(UIColor *)textColor andTextFrame:(CGRect)textFrame
{
    self = [super initWithFrame:frame andText:text andName:name andBGColour:bgColour andSelectColour:selColour andTextColour:textColor andTextFrame:textFrame];
    if (self) {
        NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"png"]];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
        [imageString release];
        self.imageLayer = [[CALayer alloc] init];
        self.imageLayer.frame = imageFrame;
        self.imageLayer.contents = (id)image.CGImage;
        [self.layer addSublayer:self.imageLayer];
        isCheckButton = YES;
    }
    return self;
}

-(void)dealloc
{
    [self.imageLayer release]; self.imageLayer = nil;
    [super dealloc];
}

@end
