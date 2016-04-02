//
//  ViewController.m
//  Demo2_JS_Music1
//
//  Created by  江苏 on 16/3/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *allTimeLabel;
@property (strong, nonatomic) IBOutlet UISlider *mySlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* mp3Path=@"/Users/jiangsu/Documents/IOS/UIKit Core/Day06/Demo2_JS_Music1/Demo2_JS_Music1/吴品醇-忆长安.mp3";
    self.player=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:mp3Path] error:nil];
    self.mySlider.minimumValue=0;
    self.mySlider.maximumValue=1;
//    self.mySlider.value=self.player.currentTime/self.player.duration;
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(shuaxin) userInfo:nil repeats:YES];
    self.currentTimeLabel.text=[NSString stringWithFormat:@"%d:%d", (int)self.player.currentTime/60,(int)self.player.currentTime%60];
    self.allTimeLabel.text=[NSString stringWithFormat:@"%d:%d", (int)self.player.duration/60,(int)self.player.duration%60];
}
- (IBAction)valuechanged:(id)sender {
    self.player.currentTime=self.mySlider.value*self.player.duration;
}
-(void)shuaxin{
    self.currentTimeLabel.text=[NSString stringWithFormat:@"%d:%d", (int)self.player.currentTime/60,(int)self.player.currentTime%60];
    self.mySlider.value=self.player.currentTime/self.player.duration;
}
- (IBAction)start:(UIButton *)sender {
    [self.player play];
}
- (IBAction)goQuickly:(id)sender {
    int i=self.player.currentTime;
    i=i+5;
    self.player.currentTime=i;
}
- (IBAction)goback:(id)sender {
    int i=self.player.currentTime;
    i=i-5;
    self.player.currentTime=i;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
