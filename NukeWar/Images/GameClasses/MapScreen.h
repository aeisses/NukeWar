//
//  MapScreen.h
//  NukeWar
//
//  Created by Aaron Eisses on 12-04-16.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "citySelect.h"
#import "CityLabel.h"

#define cityImageWidth 45
#define cityImageHeight 45

@interface MapScreen : UIView
{
    IBOutlet CityLabel *city1Label;
    IBOutlet CityLabel *city2Label;
    IBOutlet CityLabel *city3Label;
    IBOutlet CityLabel *city4Label;
    IBOutlet CityLabel *city5Label;
    
    IBOutlet CityLabel *enemy1City1Label;
    IBOutlet CityLabel *enemy1City2Label;
    IBOutlet CityLabel *enemy1City3Label;
    IBOutlet CityLabel *enemy1City4Label;
    IBOutlet CityLabel *enemy1City5Label;
    
    IBOutlet CityLabel *enemy2City1Label;
    IBOutlet CityLabel *enemy2City2Label;
    IBOutlet CityLabel *enemy2City3Label;
    IBOutlet CityLabel *enemy2City4Label;
    IBOutlet CityLabel *enemy2City5Label;
    
    IBOutlet CityLabel *enemy3City1Label;
    IBOutlet CityLabel *enemy3City2Label;
    IBOutlet CityLabel *enemy3City3Label;
    IBOutlet CityLabel *enemy3City4Label;
    IBOutlet CityLabel *enemy3City5Label;
    
    IBOutlet CityLabel *enemy4City1Label;
    IBOutlet CityLabel *enemy4City2Label;
    IBOutlet CityLabel *enemy4City3Label;
    IBOutlet CityLabel *enemy4City4Label;
    IBOutlet CityLabel *enemy4City5Label;
    
    City *city1;
    City *city2;
    City *city3;
    City *city4;
    City *city5;
    
    City *enemy1City1;
    City *enemy1City2;
    City *enemy1City3;
    City *enemy1City4;
    City *enemy1City5;
    
    City *enemy2City1;
    City *enemy2City2;
    City *enemy2City3;
    City *enemy2City4;
    City *enemy2City5;
    
    City *enemy3City1;
    City *enemy3City2;
    City *enemy3City3;
    City *enemy3City4;
    City *enemy3City5;
    
    City *enemy4City1;
    City *enemy4City2;
    City *enemy4City3;
    City *enemy4City4;
    City *enemy4City5;
    
    citySelect *myCitySelect;
}

@property (retain, nonatomic) City *city1;
@property (retain, nonatomic) City *city2;
@property (retain, nonatomic) City *city3;
@property (retain, nonatomic) City *city4;
@property (retain, nonatomic) City *city5;
@property (retain, nonatomic) City *enemy1City1;
@property (retain, nonatomic) City *enemy1City2;
@property (retain, nonatomic) City *enemy1City3;
@property (retain, nonatomic) City *enemy1City4;
@property (retain, nonatomic) City *enemy1City5;
@property (retain, nonatomic) City *enemy2City1;
@property (retain, nonatomic) City *enemy2City2;
@property (retain, nonatomic) City *enemy2City3;
@property (retain, nonatomic) City *enemy2City4;
@property (retain, nonatomic) City *enemy2City5;
@property (retain, nonatomic) City *enemy3City1;
@property (retain, nonatomic) City *enemy3City2;
@property (retain, nonatomic) City *enemy3City3;
@property (retain, nonatomic) City *enemy3City4;
@property (retain, nonatomic) City *enemy3City5;
@property (retain, nonatomic) City *enemy4City1;
@property (retain, nonatomic) City *enemy4City2;
@property (retain, nonatomic) City *enemy4City3;
@property (retain, nonatomic) City *enemy4City4;
@property (retain, nonatomic) City *enemy4City5;
@property (retain, nonatomic) citySelect *myCitySelect;

-(void)createCities;
-(void)addTargetAtFrame:(CGRect)frame;
-(void)removeTarget;
-(void)updateCities;
-(City *)getSmallestCityForQuadrant:(int)quadrant;
-(City *)getLargestCityForQuadrant:(int)quadrant;
-(City *)getRandomCityForQuadrant:(int)quadrant;

@end
