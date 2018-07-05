//
//  EEGIFVideoContainerView.h
//  BFRImageViewer
//
//  Created by Salman Husain on 7/3/18.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EEGIFVideoContainerView : UIView
+ (void)setVideoURL:(NSURL *)videoURL;
@property (strong,nonatomic) AVPlayerViewController *playerVC;
@property (strong, nonatomic, nonnull) NSURL* videoURL;

@end

NS_ASSUME_NONNULL_END
