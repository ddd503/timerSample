//
//  ViewController.m
//  singleTimer
//
//  Created by kawaharadai on 2017/10/02.
//  Copyright © 2017年 dai kawahara. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSTimer *timer;
@property (nonatomic) NSArray *numberList;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) int getCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberList = @[@1, @2, @3, @4, @5, @6];
}

- (void)hoge:(NSTimer *)timer {
    if (self.getCount >= self.numberList.count) {
        self.getCount = 0;
    }
    
    id selectCount = self.numberList[self.getCount];
    
    NSString *labelCountText = [NSString stringWithFormat:@"%@",selectCount];
    
    self.resultLabel.text = labelCountText;
    // indexをずらす
    self.getCount ++;
}

/// スタートボタン
- (IBAction)timerStart:(id)sender {
    // 初期化
    [self.timer invalidate];
    
    // 0.03秒ごとにhogeメソッドの実行をスタート
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.03f
                                                  target:self
                                                selector:@selector(hoge:)
                                                userInfo:nil
                                                 repeats:YES];
}

/// ストップボタン
- (IBAction)timerStop:(id)sender {
    [self.timer invalidate];
}

@end
