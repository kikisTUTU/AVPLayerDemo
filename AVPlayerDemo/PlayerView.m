//
//  PlayerView.m
//  AVPlayerDemo
//
//  Created by 贺凯 on 16/9/9.
//  Copyright © 2016年 贺凯. All rights reserved.
//

#import "PlayerView.h"
#import <AVFoundation/AVFoundation.h>
@implementation PlayerView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
