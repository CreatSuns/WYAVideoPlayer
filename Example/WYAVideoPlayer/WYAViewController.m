//
//  WYAViewController.m
//  WYAVideoPlayer
//
//  Created by 1228506851@qq.com on 06/22/2018.
//  Copyright (c) 2018 1228506851@qq.com. All rights reserved.
//

#import "WYAViewController.h"
#import <WYAVideoPlayer/WYAVideoItem.h>
#import <WYAVideoPlayer/WYAVideoPlayerView.h>
#import <Masonry/Masonry.h>

#define swidth  [UIScreen mainScreen].bounds.size.width
#define sheight [UIScreen mainScreen].bounds.size.height

@interface WYAViewController ()<VideoPlayerDelegate>

@property (nonatomic, strong)WYAVideoPlayerView * playView;

@end

@implementation WYAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    float hei = 9.0/16.0*414;
    CGRect frame = CGRectMake(0, (sheight-hei)/2, swidth, hei);
    WYAVideoItem * item = [[WYAVideoItem alloc]init];
    item.videoUrl = [NSURL URLWithString:@"http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4"];
    item.superV = self.view;
    item.rect = frame;
    item.seekTime = 10;
    item.seekToTimeAutoPlay = NO;
    NSLog(@"width==%f",swidth);
    
    
    self.playView = [[WYAVideoPlayerView alloc]init];
    self.playView.playerDelegate = self;
    //    self.playView.frame = frame;
    //    self.playView.needOneClick = NO;
    [self.view addSubview:self.playView];
    
    [self.playView registerPlayerItem:item];
    [self.playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(hei);
    }];
}

-(void)videoEnd{
    [self.playView RestorePlayerToOriginalFrame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
