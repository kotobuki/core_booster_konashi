//
//  ViewController.h
//  BareMinimum
//
//  Created by Shigeru Kobayashi on 2013/09/22.
//  Copyright (c) 2013年 Shigeru Kobayashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *servoAngleController;
- (IBAction)servoAngleControllerChanged:(id)sender;

@end
