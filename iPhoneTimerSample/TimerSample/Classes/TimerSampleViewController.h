//
//  TimerSampleViewController.h
//  TimerSample
//
//  Created by mmlemon on 09/07/06.
//  Copyright hi-farm.net 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerSampleViewController : UIViewController {
	
	IBOutlet UIButton *startBtn;
	IBOutlet UIButton *stopBtn;
	IBOutlet UITextField *resTf;
	// startとstop共通のボタン
	IBOutlet UIButton *startAndStopBtn;
	
	NSTimeInterval startTime;
	NSTimeInterval currentTime;
	NSTimer *timer;
	// タイマーが動いている状態かどうかを示すフラグ
	// true: 動作中  false: 停止中
	BOOL starting;
}

@property(nonatomic, retain) IBOutlet UIButton *startBtn;
@property(nonatomic, retain) IBOutlet UIButton *stopBtn;
@property(nonatomic, retain) IBOutlet UITextField *resTf;
@property(nonatomic, retain) IBOutlet UIButton *startAndStopBtn;

@property(readwrite) NSTimeInterval startTime;
@property(readwrite) NSTimeInterval currentTime;
@property(nonatomic, retain) NSTimer *timer;

-(IBAction) startTimer;
-(IBAction) stopTimer;

-(IBAction) startAndStopTimer;

@end

