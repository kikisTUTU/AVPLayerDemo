//
//  ViewController.m
//  AVPlayerDemo
//
//  Created by 贺凯 on 16/9/8.
//  Copyright © 2016年 贺凯. All rights reserved.
//
#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PlayerView.h"
#define URL1 @"http://www.jxvdy.com/file/upload/201405/05/18-24-58-42-627.mp4"
#define URL2 @"http://live-shitou.kksmg.com/live/shitou/playlist.m3u8"
#define URL3 @"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
#define URL4 @"rtsp://192.168.1.120:10554/nvr0000002?channel=1"
@interface ViewController ()
@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)AVPlayerItem *playerItem;
@property(nonatomic,strong)UIProgressView *progress;
@property(nonatomic,strong)UISlider *slider;
//滑块slider的按下或弹起的状态
@property(nonatomic)BOOL isOpen;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUi];
//    NSURL * url=[NSURL URLWithString:@"http://pl.youku.com/playlist/m3u8?vid=315437230&type=flv&ts=1439774164&keyframe=0&ep=ciaXE06KUs8G4SHcjj8bZiuxdCFcXP0L8xuGhtBhANQgTeC4&sid=04397741642361217c0fc&token=4587&ctype=12&ev=1&oip=-1609538113"];
//    NSURL *url = [NSURL URLWithString:URL1];
    NSURL *url = [NSURL URLWithString:URL4];
    //创建item
//    _playerItem=[[AVPlayerItem alloc]initWithURL:url];
    AVURLAsset *asset = [AVURLAsset assetWithURL:url];
    self.playerItem = [AVPlayerItem playerItemWithAsset:asset];
    //创建player
    _player = [[AVPlayer alloc]initWithPlayerItem:_playerItem];
    //生成layer层
    AVPlayerLayer * layer = [AVPlayerLayer playerLayerWithPlayer:_player];
    //设置坐标
    layer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //把layer层加入到self.View中
    [self.view.layer addSublayer:layer];
    //进行播放
    [_player play];
    //kvo 观察播放状态playerItem.status
    /*
     NSKeyValueObservingOptionNew = 0x01,
     NSKeyValueObservingOptionOld
     */
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //观察缓存现在的进度，KVO进行观察，观察     playerItem.loadedTimeRanges的属性
    [_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)createUi
{
    _progress = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progress.frame = CGRectMake(0, 460, self.view.frame.size.width, 10);
    [self.view addSubview:_progress];
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 480, self.view.frame.size.width, 10)];
    [self.view addSubview:_slider];
    //给slider添加点击事件
    //按下去的时候
    [_slider addTarget:self action:@selector(sliderClickDown:) forControlEvents:UIControlEventTouchDown];
    //弹起来的时候
    [_slider addTarget:self action:@selector(sliderClickUP:) forControlEvents:UIControlEventTouchUpInside];
}
//slider按下去事件
-(void)sliderClickDown:(UISlider *)slider1
{
    NSLog(@"slider按下去");
    _isOpen=YES;
}
//slider弹起来事件
-(void)sliderClickUP:(UISlider*)slider1
{
    NSLog(@"slider弹起来");
    _isOpen=NO;
    
    //从滑块的位置开始播放
    CGFloat g = slider1.value;
    //总时长
    CMTime  time1 = _playerItem.duration;
    float X = CMTimeGetSeconds(time1);
    [_player seekToTime:CMTimeMake(X*g, 1)];
    [_player play];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        if (_playerItem.status == AVPlayerStatusReadyToPlay) {
            NSLog(@"开始播放");
            //需要开始获取数据，包括播放的总时长，播放的缓存，播放的当前时间
            [self loadData];
        }
        else{
            NSLog(@"播放失败");
        }
    }else{
        
        //kvo触发的另外一个属性返回的是一个数组
        NSArray *ary=[_playerItem loadedTimeRanges];
        //获取范围
        CMTimeRange range = [ary.firstObject CMTimeRangeValue];
        //从哪里开始缓存
        CGFloat  start = CMTimeGetSeconds(range.start);
        //缓存了多少
        CGFloat duration = CMTimeGetSeconds(range.duration);
        //一共缓存了多少
        CGFloat  allCache=start + duration;
        NSLog(@"缓存：%f",allCache);
        //设置缓存百分比
        CMTime allTime = [_playerItem duration];
        //转换成秒
        CGFloat time = CMTimeGetSeconds(allTime);
        CGFloat y = allCache/time;
        NSLog(@"缓存百分比：%f",y);
        
        //给缓存的滑块赋值
        _progress.progress = y;
        
    }
}
-(void)loadData
{
    //第一个参数没隔多久调用一次
    //    __weak AVPlayerItem *playerItem1=_playerItem;
    //    __weak UISlider *slider1=_slider;
    //    //__weak BOOL isOpen1=isOpen;
    
    __weak typeof(self) weakSelf = self;
    [weakSelf.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:NULL usingBlock:^(CMTime time) {
        //当前播放时间
        CGFloat  currentime = _playerItem.currentTime.value/_playerItem.currentTime.timescale;
        NSLog(@"当前时间：%f",currentime);
        //总时长
        
        CMTime  time1 = weakSelf.playerItem.duration;
        float X=CMTimeGetSeconds(time1);
        NSLog(@"总时长：%f",X);
        
        //设置滑动条的进度
        float v = currentime/X;
        //判断slider是否按下
        if(!_isOpen){
            weakSelf.slider.value = v;
        }
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end





















