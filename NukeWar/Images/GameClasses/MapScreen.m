//
//  MapScreen.m
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapScreen.h"

@implementation MapScreen

@synthesize city1;
@synthesize city2;
@synthesize city3;
@synthesize city4;
@synthesize city5;
@synthesize enemy1City1;
@synthesize enemy1City2;
@synthesize enemy1City3;
@synthesize enemy1City4;
@synthesize enemy1City5;
@synthesize enemy2City1;
@synthesize enemy2City2;
@synthesize enemy2City3;
@synthesize enemy2City4;
@synthesize enemy2City5;
@synthesize enemy3City1;
@synthesize enemy3City2;
@synthesize enemy3City3;
@synthesize enemy3City4;
@synthesize enemy3City5;
@synthesize enemy4City1;
@synthesize enemy4City2;
@synthesize enemy4City3;
@synthesize enemy4City4;
@synthesize enemy4City5;
@synthesize myCitySelect;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(City *)getRandomCityForQuadrant:(int)quadrant
{
    City *returnCity = nil;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:5];
    switch (quadrant) {
        case 1:
        {
            if (!enemy1City1.isCityDestroyed) {
                [array addObject:enemy1City1];
            }
            if (!enemy1City2.isCityDestroyed) {
                [array addObject:enemy1City2];
            }
            if (!enemy1City3.isCityDestroyed) {
                [array addObject:enemy1City3];
            }
            if (!enemy1City4.isCityDestroyed) {
                [array addObject:enemy1City4];
            }
            if (!enemy1City5.isCityDestroyed) {
                [array addObject:enemy1City5];
            }
            if ([array count] == 0) {
                [array addObject:enemy1City5];
            }
        }
            break;
        case 2:
        {
            if (!enemy2City1.isCityDestroyed) {
                [array addObject:enemy2City1];
            }
            if (!enemy2City2.isCityDestroyed) {
                [array addObject:enemy2City2];
            }
            if (!enemy2City3.isCityDestroyed) {
                [array addObject:enemy2City3];
            }
            if (!enemy2City4.isCityDestroyed) {
                [array addObject:enemy2City4];
            }
            if (!enemy2City5.isCityDestroyed) {
                [array addObject:enemy2City5];
            }
            if ([array count] == 0) {
                [array addObject:enemy2City5];
            }
        }
            break;
        case 3:
        {
            if (!enemy3City1.isCityDestroyed) {
                [array addObject:enemy3City1];
            }
            if (!enemy3City2.isCityDestroyed) {
                [array addObject:enemy3City2];
            }
            if (!enemy3City3.isCityDestroyed) {
                [array addObject:enemy3City3];
            }
            if (!enemy3City4.isCityDestroyed) {
                [array addObject:enemy3City4];
            }
            if (!enemy3City5.isCityDestroyed) {
                [array addObject:enemy3City5];
            }
            if ([array count] == 0) {
                [array addObject:enemy3City5];
            }
        }
            break;
        case 4:
        {
            if (!enemy4City1.isCityDestroyed) {
                [array addObject:enemy4City1];
            }
            if (!enemy4City2.isCityDestroyed) {
                [array addObject:enemy4City2];
            }
            if (!enemy4City3.isCityDestroyed) {
                [array addObject:enemy4City3];
            }
            if (!enemy4City4.isCityDestroyed) {
                [array addObject:enemy4City4];
            }
            if (!enemy4City5.isCityDestroyed) {
                [array addObject:enemy4City5];
            }
            if ([array count] == 0) {
                [array addObject:enemy4City5];
            }
        }
            break;
        default:
        {
            if (!city1.isCityDestroyed) {
                [array addObject:city1];
            }
            if (!city2.isCityDestroyed) {
                [array addObject:city2];
            }
            if (!city3.isCityDestroyed) {
                [array addObject:city3];
            }
            if (!city4.isCityDestroyed) {
                [array addObject:city4];
            }
            if (!city5.isCityDestroyed) {
                [array addObject:city5];
            }
            if ([array count] == 0) {
                [array addObject:city5];
            }
        }
            break;
    }
    returnCity = [array objectAtIndex:arc4random()%array.count];
    [array release];
    return returnCity;
}

-(City *)getSmallestCityForQuadrant:(int)quadrant
{
    City *returnCity = nil;
    switch (quadrant) {
        case 1:
        {
            if (!enemy1City1.isCityDestroyed && enemy1City1.population > 0) {
                returnCity = enemy1City1;
            }
            if ((returnCity.population > enemy1City2.population && !enemy1City2.isCityDestroyed && enemy1City2.population > 0) ||
                (enemy1City2.population > 0 && returnCity == nil)) {
                returnCity = enemy1City2;
            }
            if ((returnCity.population > enemy1City3.population && !enemy1City3.isCityDestroyed && enemy1City3.population > 0) ||
                (enemy1City3.population > 0 && returnCity == nil)) {
                returnCity = enemy1City3;
            }
            if ((returnCity.population > enemy1City4.population && !enemy1City4.isCityDestroyed && enemy1City4.population > 0) ||
                (enemy1City4.population > 0 && returnCity == nil)) {
                returnCity = enemy1City4;
            }
            if ((returnCity.population > enemy1City5.population && !enemy1City5.isCityDestroyed && enemy1City5.population > 0) ||
                (enemy1City5.population > 0 && returnCity == nil)) {
                returnCity = enemy1City5;
            }
        }
            break;
        case 2:
        {
            if(!enemy2City1.isCityDestroyed && enemy2City1.population > 0) {
                returnCity = enemy2City1;
            }
            if ((returnCity.population > enemy2City2.population && !enemy2City2.isCityDestroyed  && enemy2City2.population > 0) ||
                (enemy2City2.population > 0 && returnCity == nil)) {
                returnCity = enemy2City2;
            }
            if ((returnCity.population > enemy2City3.population && !enemy2City3.isCityDestroyed && enemy2City3.population > 0) ||
                (enemy2City3.population > 0 && returnCity == nil)) {
                returnCity = enemy2City3;
            }
            if ((returnCity.population > enemy2City4.population && !enemy2City4.isCityDestroyed && enemy2City4.population > 0) ||
                (enemy2City4.population > 0 && returnCity == nil)) {
                returnCity = enemy2City4;
            }
            if ((returnCity.population > enemy2City5.population && !enemy2City5.isCityDestroyed && enemy2City5.population > 0) ||
                (enemy2City5.population > 0 && returnCity == nil)) {
                returnCity = enemy2City5;
            }
        }
            break;
        case 3:
        {
            if (!enemy3City1.isCityDestroyed && enemy3City1.population > 0) {
                returnCity = enemy3City1;
            }
            if ((returnCity.population > enemy3City2.population && !enemy3City2.isCityDestroyed && enemy3City2.population > 0) ||
                (enemy3City2.population > 0 && returnCity == nil)) {
                returnCity = enemy3City2;
            }
            if ((returnCity.population > enemy3City3.population && !enemy3City3.isCityDestroyed && enemy3City3.population > 0) ||
                (enemy3City3.population > 0 && returnCity == nil)) {
                returnCity = enemy3City3;
            }
            if ((returnCity.population > enemy3City4.population && !enemy3City4.isCityDestroyed && enemy3City4.population > 0) ||
                (enemy3City4.population > 0 && returnCity == nil)) {
                returnCity = enemy3City4;
            }
            if ((returnCity.population > enemy3City5.population && !enemy3City5.isCityDestroyed && enemy3City5.population > 0) ||
                (enemy3City5.population > 0 && returnCity == nil)) {
                returnCity = enemy3City5;
            }
        }
            break;
        case 4:
        {
            if (!enemy4City1.isCityDestroyed && enemy4City1.population > 0) {
                returnCity = enemy4City1;
            }
            if ((returnCity.population > enemy4City2.population && !enemy4City2.isCityDestroyed && enemy4City2.population > 0) ||
                (enemy4City2.population > 0 && returnCity == nil)) {
                returnCity = enemy4City2;
            }
            if ((returnCity.population > enemy4City3.population && !enemy4City3.isCityDestroyed && enemy4City3.population > 0) ||
                (enemy4City3.population > 0 && returnCity == nil)) {
                returnCity = enemy4City3;
            }
            if ((returnCity.population > enemy4City4.population && !enemy4City4.isCityDestroyed && enemy4City4.population > 0) ||
                (enemy4City4.population > 0 && returnCity == nil)) {
                returnCity = enemy4City4;
            }
            if ((returnCity.population > enemy4City5.population && !enemy4City5.isCityDestroyed && enemy4City5.population > 0) ||
                (enemy4City5.population > 0 && returnCity == nil)) {
                returnCity = enemy4City5;
            }
        }
            break;
        default:
        {
            if (!city1.isCityDestroyed && city1.population > 0) {
                returnCity = city1;
            }
            if ((returnCity.population > city2.population && !city2.isCityDestroyed && city2.population > 0) ||
                (city2.population > 0 && returnCity == nil)) {
                returnCity = city2;
            }
            if ((returnCity.population > city3.population && !city3.isCityDestroyed && city3.population > 0) ||
                (city3.population > 0 && returnCity == nil)) {
                returnCity = city3;
            }
            if ((returnCity.population > city4.population && !city4.isCityDestroyed && city4.population > 0) ||
                (city4.population > 0 && returnCity == nil)) {
                returnCity = city4;
            }
            if ((returnCity.population > city5.population && !city5.isCityDestroyed && city5.population > 0) ||
                (city5.population > 0 && returnCity == nil)) {
                returnCity = city5;
            }
        }
            break;
    }
    return returnCity;
}

-(City *)getLargestCityForQuadrant:(int)quadrant
{
    City *returnCity = nil;
    switch (quadrant) {
        case 1:
        {
            returnCity = enemy1City1;
            if (returnCity.population < enemy1City2.population) {
                returnCity = enemy1City2;
            }
            if (returnCity.population < enemy1City3.population) {
                returnCity = enemy1City3;
            }
            if (returnCity.population < enemy1City4.population) {
                returnCity = enemy1City4;
            }
            if (returnCity.population < enemy1City5.population) {
                returnCity = enemy1City5;
            }
        }
            break;
        case 2:
        {
            returnCity = enemy2City1;
            if (returnCity.population < enemy2City2.population) {
                returnCity = enemy2City2;
            }
            if (returnCity.population < enemy2City3.population) {
                returnCity = enemy2City3;
            }
            if (returnCity.population < enemy2City4.population) {
                returnCity = enemy2City4;
            }
            if (returnCity.population < enemy2City5.population) {
                returnCity = enemy2City5;
            }
        }
            break;
        case 3:
        {
            returnCity = enemy3City1;
            if (returnCity.population < enemy3City2.population) {
                returnCity = enemy3City2;
            }
            if (returnCity.population < enemy3City3.population) {
                returnCity = enemy3City3;
            }
            if (returnCity.population < enemy3City4.population) {
                returnCity = enemy3City4;
            }
            if (returnCity.population < enemy3City5.population) {
                returnCity = enemy3City5;
            }
        }
            break;
        case 4:
        {
            returnCity = enemy4City1;
            if (returnCity.population < enemy4City2.population) {
                returnCity = enemy4City2;
            }
            if (returnCity.population < enemy4City3.population) {
                returnCity = enemy4City3;
            }
            if (returnCity.population < enemy4City4.population) {
                returnCity = enemy4City4;
            }
            if (returnCity.population < enemy4City5.population) {
                returnCity = enemy4City5;
            }
        }
            break;
        default:
        {
            returnCity = city1;
            if (returnCity.population < city2.population) {
                returnCity = city2;
            }
            if (returnCity.population < city3.population) {
                returnCity = city3;
            }
            if (returnCity.population < city4.population) {
                returnCity = city4;
            }
            if (returnCity.population < city5.population) {
                returnCity = city5;
            }
        }
            break;
    }
    return returnCity;
}

-(void)createCities
{
    NSString *cityImageFileName = [[NSString alloc] initWithString:@"citiesSheet"];
    NSString *imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:cityImageFileName ofType:@"png"]];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imageString];
    [imageString release];
    city1 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(449, 288, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:city1.cityImage];
    city1Label.text = [NSString stringWithFormat:@"%i",city1.population];
    city2 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(384, 367, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:city2.cityImage];
    city2Label.text = [NSString stringWithFormat:@"%i",city2.population];
    city3 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(541, 307, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:city3.cityImage];
    city3Label.text = [NSString stringWithFormat:@"%i",city3.population];
    city4 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(586, 397, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:city4.cityImage];
    city4Label.text = [NSString stringWithFormat:@"%i",city4.population];
    city5 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(491, 492, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:city5.cityImage];
    city5Label.text = [NSString stringWithFormat:@"%i",city5.population];
    enemy1City1 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(162, 87, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy1City1.cityImage];
    enemy1City1Label.text = [NSString stringWithFormat:@"%i",enemy1City1.population];
    enemy1City2 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(84, 138, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy1City2.cityImage];
    enemy1City2Label.text = [NSString stringWithFormat:@"%i",enemy1City2.population];
    enemy1City3 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(84, 234, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy1City3.cityImage];
    enemy1City3Label.text = [NSString stringWithFormat:@"%i",enemy1City3.population];
    enemy1City4 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(239, 203, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy1City4.cityImage];
    enemy1City4Label.text = [NSString stringWithFormat:@"%i",enemy1City4.population];
    enemy1City5 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(157, 298, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy1City5.cityImage];
    enemy1City5Label.text = [NSString stringWithFormat:@"%i",enemy1City5.population];
    enemy2City1 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(749, 104, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy2City1.cityImage];
    enemy2City1Label.text = [NSString stringWithFormat:@"%i",enemy2City1.population];
    enemy2City2 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(879, 104, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy2City2.cityImage];
    enemy2City2Label.text = [NSString stringWithFormat:@"%i",enemy2City2.population];
    enemy2City3 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(910, 189, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy2City3.cityImage];
    enemy2City3Label.text = [NSString stringWithFormat:@"%i",enemy2City3.population];
    enemy2City4 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(749, 273, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy2City4.cityImage];
    enemy2City4Label.text = [NSString stringWithFormat:@"%i",enemy2City4.population];
    enemy2City5 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(879, 279, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy2City5.cityImage];
    enemy2City5Label.text = [NSString stringWithFormat:@"%i",enemy2City5.population];
    enemy3City1 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(162, 436, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy3City1.cityImage];
    enemy3City1Label.text = [NSString stringWithFormat:@"%i",enemy3City1.population];
    enemy3City2 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(77, 515, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy3City2.cityImage];
    enemy3City2Label.text = [NSString stringWithFormat:@"%i",enemy3City2.population];
    enemy3City3 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(251, 515, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy3City3.cityImage];
    enemy3City3Label.text = [NSString stringWithFormat:@"%i",enemy3City3.population];
    enemy3City4 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(94, 616, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy3City4.cityImage];
    enemy3City4Label.text = [NSString stringWithFormat:@"%i",enemy3City4.population];
    enemy3City5 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(203, 672, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy3City5.cityImage];
    enemy3City5Label.text = [NSString stringWithFormat:@"%i",enemy3City5.population];
    enemy4City1 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(824, 462, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy4City1.cityImage];
    enemy4City1Label.text = [NSString stringWithFormat:@"%i",enemy4City1.population];
    enemy4City2 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(708, 570, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy4City2.cityImage];
    enemy4City2Label.text = [NSString stringWithFormat:@"%i",enemy4City2.population];
    enemy4City3 =[[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(739, 477, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy4City3.cityImage];
    enemy4City3Label.text = [NSString stringWithFormat:@"%i",enemy4City3.population];
    enemy4City4 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(939, 570, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy4City4.cityImage];
    enemy4City4Label.text = [NSString stringWithFormat:@"%i",enemy4City4.population];
    enemy4City5 = [[City alloc] initWithFile:cityImageFileName andImage:image andFrame:CGRectMake(824, 683, cityImageWidth, cityImageHeight)];
    [[self layer] addSublayer:enemy4City5.cityImage];
    enemy4City5Label.text = [NSString stringWithFormat:@"%i",enemy4City5.population];
    [image release];
    [cityImageFileName release];
    
    NSString *citySelectImageFileName = [[NSString alloc] initWithString:@"citySelectSheet"];
    imageString = [[NSString alloc] initWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:citySelectImageFileName ofType:@"png"]];
    image = [[UIImage alloc] initWithContentsOfFile:imageString];
    [imageString release];
    myCitySelect = [[citySelect alloc] initWithFile:citySelectImageFileName andImage:image andFrame:CGRectMake(0, 0, 55, 55)];
    [image release];
    [citySelectImageFileName release];
}

-(void)addTargetAtFrame:(CGRect)frame
{
    [myCitySelect showAnimationAtFrame:frame];
    [[self layer] addSublayer:myCitySelect.target];
}

-(void)removeTarget
{
    [myCitySelect removeAnimation];
    [myCitySelect.target removeFromSuperlayer];
}

-(void)updateCities
{
    [city1 updateCity];
    city1Label.text = [NSString stringWithFormat:@"%i",city1.population];
    [city2 updateCity];
    city2Label.text = [NSString stringWithFormat:@"%i",city2.population];
    [city3 updateCity];
    city3Label.text = [NSString stringWithFormat:@"%i",city3.population];
    [city4 updateCity];
    city4Label.text = [NSString stringWithFormat:@"%i",city4.population];
    [city5 updateCity];
    city5Label.text = [NSString stringWithFormat:@"%i",city5.population];
    [enemy1City1 updateCity];
    enemy1City1Label.text = [NSString stringWithFormat:@"%i",enemy1City1.population];
    [enemy1City2 updateCity];
    enemy1City2Label.text = [NSString stringWithFormat:@"%i",enemy1City2.population];
    [enemy1City3 updateCity];
    enemy1City3Label.text = [NSString stringWithFormat:@"%i",enemy1City3.population];
    [enemy1City4 updateCity];
    enemy1City4Label.text = [NSString stringWithFormat:@"%i",enemy1City4.population];
    [enemy1City5 updateCity];
    enemy1City5Label.text = [NSString stringWithFormat:@"%i",enemy1City5.population];
    [enemy2City1 updateCity];
    enemy2City1Label.text = [NSString stringWithFormat:@"%i",enemy2City1.population];
    [enemy2City2 updateCity];
    enemy2City2Label.text = [NSString stringWithFormat:@"%i",enemy2City2.population];
    [enemy2City3 updateCity];
    enemy2City3Label.text = [NSString stringWithFormat:@"%i",enemy2City3.population];
    [enemy2City4 updateCity];
    enemy2City4Label.text = [NSString stringWithFormat:@"%i",enemy2City4.population];
    [enemy2City5 updateCity];
    enemy2City5Label.text = [NSString stringWithFormat:@"%i",enemy2City5.population];
    [enemy3City1 updateCity];
    enemy3City1Label.text = [NSString stringWithFormat:@"%i",enemy3City1.population];
    [enemy3City2 updateCity];
    enemy3City2Label.text = [NSString stringWithFormat:@"%i",enemy3City2.population];
    [enemy3City3 updateCity];
    enemy3City3Label.text = [NSString stringWithFormat:@"%i",enemy3City3.population];
    [enemy3City4 updateCity];
    enemy3City4Label.text = [NSString stringWithFormat:@"%i",enemy3City4.population];
    [enemy3City5 updateCity];
    enemy3City5Label.text = [NSString stringWithFormat:@"%i",enemy3City5.population];
    [enemy4City1 updateCity];
    enemy4City1Label.text = [NSString stringWithFormat:@"%i",enemy4City1.population];
    [enemy4City2 updateCity];
    enemy4City2Label.text = [NSString stringWithFormat:@"%i",enemy4City2.population];
    [enemy4City3 updateCity];
    enemy4City3Label.text = [NSString stringWithFormat:@"%i",enemy4City3.population];
    [enemy4City4 updateCity];
    enemy4City4Label.text = [NSString stringWithFormat:@"%i",enemy4City4.population];
    [enemy4City5 updateCity];
    enemy4City5Label.text = [NSString stringWithFormat:@"%i",enemy4City5.population];
}

-(void)dealloc
{
    [city1 release]; city1 = nil;
    [city2 release]; city2 = nil;
    [city3 release]; city3 = nil;
    [city4 release]; city4 = nil;
    [city5 release]; city5 = nil;
    [enemy1City1 release]; enemy1City1 = nil;
    [enemy1City2 release]; enemy1City2 = nil;
    [enemy1City3 release]; enemy1City2 = nil;
    [enemy1City4 release]; enemy1City2 = nil;
    [enemy1City5 release]; enemy1City2 = nil;
    [enemy2City1 release]; enemy1City2 = nil;
    [enemy2City2 release]; enemy1City2 = nil;
    [enemy2City3 release]; enemy1City2 = nil;
    [enemy2City4 release]; enemy1City2 = nil;
    [enemy2City5 release]; enemy1City2 = nil;
    [enemy3City1 release]; enemy1City2 = nil;
    [enemy3City2 release]; enemy1City2 = nil;
    [enemy3City3 release]; enemy1City2 = nil;
    [enemy3City4 release]; enemy1City2 = nil;
    [enemy3City5 release]; enemy1City2 = nil;
    [enemy4City1 release]; enemy1City2 = nil;
    [enemy4City2 release]; enemy1City2 = nil;
    [enemy4City3 release]; enemy1City2 = nil;
    [enemy4City4 release]; enemy1City2 = nil;
    [enemy4City5 release]; enemy1City2 = nil;
    [myCitySelect release]; myCitySelect = nil;
    [super dealloc];
}
@end
