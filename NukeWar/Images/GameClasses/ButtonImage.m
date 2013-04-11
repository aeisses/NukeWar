//
//  ButtonImage.m
//  NukeWar
//
//  Created by Aaron Eisses on 13-03-05.
//
//

#import "ButtonImage.h"

@implementation ButtonImage

-(id)initWithImage:(NSString *)fileName isSelected:(BOOL)isSelected andFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
//        [self setBackgroundColor:[[Colours getShadowColourWithAlpha:0.6] CGColor]];
//        [self setOpacity:1.00f];
//        self.layer.cornerRadius = (float)3;
//        topLayer = [[CALayer alloc] init];
//        [topLayer setOpacity:1.0f];
//        topLayer.frame = CGRectMake(-2,-2,frame.size.width,frame.size.height);
        [self setBackgroundColor:[[Colours getCharacterBackgroundColor:1.0] CGColor]];
//        topLayer.borderWidth = (float)3;
//        topLayer.cornerRadius = (float)3;
//        topLayer.borderColor = [[Colours getTextColourWithAlpha:1.0] CGColor];
        NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"png"]];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
        [imageString release];
        CALayer *imageLayer = [[CALayer alloc] init];
        imageLayer.frame = CGRectMake(20,5,110,140);
        imageLayer.contents = (id)image.CGImage;
        [self addSublayer:imageLayer];
    }
    return self;
}

@end
