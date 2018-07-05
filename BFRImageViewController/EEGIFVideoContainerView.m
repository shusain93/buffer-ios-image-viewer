//
//  EEGIFVideoContainerView.m
//  BFRImageViewer
//
//  Created by Salman Husain on 7/3/18.
//

#import "EEGIFVideoContainerView.h"


@implementation EEGIFVideoContainerView
@synthesize videoURL;
@synthesize playerVC;


/**
 Get a video container which plays the given video "gif"
 
 @param url The NSURL
 @return self
 */
-(id)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        videoURL = url;
    }
    return self;
}

+ (void)setVideoURL:(NSURL *)videoURL {
    self.videoURL = videoURL;
}


/**
 Pretty much the same as viewDidLoad
 */
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryAmbient error:nil];
    [[AVAudioSession sharedInstance]setActive:YES error:nil];
    AVPlayerViewController * playerVC = [[AVPlayerViewController alloc]init];
    playerVC.showsPlaybackControls = false;
    AVPlayer *player = [[AVPlayer alloc]initWithURL:videoURL];
    [playerVC setPlayer:player];
    AVPlayerLayer *layer = [[AVPlayerLayer alloc]init];
    layer.player = player;
    
    [player play];
    [self addSubview:playerVC.view];
	[playerVC.view setUserInteractionEnabled:NO];
    
    //Looping
    player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[player currentItem]];
    
    self.playerVC = playerVC;
    
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)layoutSubviews {
	[playerVC.view setFrame:self.frame];
    [super layoutSubviews];
}




@end
