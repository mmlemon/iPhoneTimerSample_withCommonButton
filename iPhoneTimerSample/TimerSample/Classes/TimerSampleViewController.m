//
//  TimerSampleViewController.m
//  TimerSample
//
//  Created by mmlemon on 09/07/06.
//  Copyright hi-farm.net 2009. All rights reserved.
//

#import "TimerSampleViewController.h"

@implementation TimerSampleViewController

@synthesize startBtn;
@synthesize stopBtn;
@synthesize resTf;
@synthesize startTime;
@synthesize timer;
@synthesize currentTime;
@synthesize startAndStopBtn;

// 継続的に呼ばれる。
-(void)updateTimer:(NSTimer *)t
{
	// 経過時刻をアップデート
	self.currentTime = [NSDate timeIntervalSinceReferenceDate] - self.startTime;
	// 表示
	[self.resTf setText:[NSString stringWithFormat:@"%.4f sec", currentTime]];
}

#pragma mark -
#pragma mark 共通ボタンの為に実際の処理だけのメソッドに分離

-(void)stopTimerProc
{
	// 時間を算出
	currentTime = [NSDate timeIntervalSinceReferenceDate] - self.startTime;
	// 経過時間を表示
	[self.resTf setText:[NSString stringWithFormat:@"%.4f sec", currentTime]];
	// ボタンの有効無効を設定
	[self.startBtn setEnabled:YES];
	[self.stopBtn setEnabled:NO];
	// タイマーを停止
	[self.timer invalidate];
	// 共通ボタンとの整合性をあわせる
	starting = NO;
}

-(void)startTimerProc
{
	// 数値を初期化
	self.currentTime = 0;
	// 開始
	// 開始時刻を保持
	self.startTime = [NSDate timeIntervalSinceReferenceDate];
	// 時間をアップデートできるように設定
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01
												  target:self
												selector:@selector(updateTimer:)
												userInfo:nil
												 repeats:YES
				  ];
	
	// ボタンの有効無効を切り替える
	[self.startBtn setEnabled:NO];
	[self.stopBtn setEnabled:YES];
	// 共通ボタンとの整合性をあわせる
	starting =YES;
}

#pragma mark -
#pragma mark ボタンそれぞれ操作後の処理

// 計測開始
-(IBAction) startTimer
{
	[self startTimerProc];
}

// 計測終了
-(IBAction) stopTimer
{
	[self stopTimerProc];
}

// 共通ボタンの処理。状態により切り分ける。
-(IBAction) startAndStopTimer
{
	if(starting)
	{
		[self stopTimerProc];
	}
	else 
	{
		[self startTimerProc];
	}

}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	// フラグの初期設定を行う。
	starting = NO;
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[startAndStopBtn release];
	[startBtn release];
	[stopBtn release];
	[resTf release];
    [super dealloc];
}

@end
