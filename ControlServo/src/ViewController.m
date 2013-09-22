//
//  ViewController.m
//  BareMinimum
//
//  Created by Shigeru Kobayashi on 2013/09/22.
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
    // 初期化
    [Konashi initialize];
    
    // Add an observer for KONASHI_EVENT_READY events
    // KONASHI_EVENT_READYに対するオブザーバを追加する
    [Konashi addObserver:self selector:@selector(setup) name:KONASHI_EVENT_READY];
    
    // Show the list of BLE devices and ask the user to choose a konashi module
    // BLEデバイスのリストを表示してユーザにkonashiモジュールを選択してもらう
    [Konashi find];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
    // Do any setups after connecting to a konashi module
    // konashiモジュールに接続が完了した後のセットアップを行う

    // Enable the slider for adjusting the angle of a servo
    // サーボの角度を設定するスライダーを有効にする
    [self.servoAngleController setEnabled:TRUE];

    // Set mode, period and duty of the pin connected to a servo
    // PIO5のPWMモードを有効に設定し、周期を一般的なRCサーボで用いられる20ms（＝20,000µs）に設定する
    [Konashi pwmMode:PIO5 mode:KONASHI_PWM_ENABLE];
    [Konashi pwmPeriod:PIO5 period:20000];
    [Konashi pwmDuty:PIO5 duty:1500];
    [self.servoAngleController setValue:1500];
}

- (IBAction)servoAngleControllerChanged:(id)sender {
    int duty = (int)round([self.servoAngleController value]);
    [Konashi pwmDuty:PIO5 duty:duty];
}
@end
