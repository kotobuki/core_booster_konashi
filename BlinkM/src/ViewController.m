//
//  ViewController.m
//  BareMinimum
//
//  Created by Shigeru Kobayashi on 2013/05/12.
//  Copyright (c) 2013年 Shigeru Kobayashi. All rights reserved.
//

#import "ViewController.h"

// Import the konashi library
#import "Konashi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Initialize
    [Konashi initialize];
    
    // Add an observer for KONASHI_EVENT_READY events
    [Konashi addObserver:self selector:@selector(setup) name:KONASHI_EVENT_READY];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findButtonPressed:(id)sender {
    [Konashi find];
}

- (IBAction)fadeToRandomColorButtonPressed:(id)sender {
    [blinkM setFadeSpeed:10];
    [blinkM fadeToRGBColor:(rand() % 255) green:(rand() % 255) blue:(rand() % 255)];
}

- (void)setup
{
    [Konashi i2cMode:KONASHI_I2C_ENABLE_100K];
    blinkM = [[BlinkM alloc] init];
}

@end
