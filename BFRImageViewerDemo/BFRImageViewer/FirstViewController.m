//
//  FirstViewController.m
//  BFRImageViewer
//
//  Created by Andrew Yates on 20/11/2015.
//  Copyright © 2015 Andrew Yates. All rights reserved.
//

#import "FirstViewController.h"
#import "BFRImageViewController.h"
#import "EEPhoto.h"
@interface FirstViewController () <UIViewControllerPreviewingDelegate>
@property (strong, nonatomic) NSURL *imgURL;
@end

@implementation FirstViewController

- (instancetype) init {
    if (self = [super init]) {
        self.title = @"Single Image";
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self addImageButtonToView];
    [self check3DTouch];
    
    self.imgURL = [NSURL URLWithString:@"https://buffer-media-uploads.s3.amazonaws.com/5834f2c60a34eb600e2b4e13/7bc86def18c9fef467c78a2125882ad7_e26a0823b055bff93b85c2d7271bd5df4273604d_twitter.gif"];
}

- (void)openImage {
    //Here, the image source could be an array containing/a mix of URL strings, NSURLs, PHAssets, or UIImages
	EEPhoto * a = [[EEPhoto alloc]init];
	[a setUrl:[NSURL URLWithString:@"https://i.imgur.com/XDWafFs.mp4"]];
	[a setTitle:[[NSAttributedString alloc] initWithString:@"Title test!"]];
	[a setDescription:[[NSAttributedString alloc] initWithString:@"desc test!"]];
	
	EEPhoto * c = [[EEPhoto alloc]init];
	[c setUrl:[NSURL URLWithString:@"https://buffer-media-uploads.s3.amazonaws.com/5834f2c60a34eb600e2b4e13/7bc86def18c9fef467c78a2125882ad7_e26a0823b055bff93b85c2d7271bd5df4273604d_twitter.gif"]];
	[c setTitle:nil];
	[c setDescription:nil];
	
	EEPhoto * b = [[EEPhoto alloc]init];
	[b setUrl:[NSURL URLWithString:@"https://i.imgur.com/JTQrmC4.jpg"]];
	[b setTitle:[[NSAttributedString alloc] initWithString:@"LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE! LONG TITLE!"]];
	[b setDescription:[[NSAttributedString alloc] initWithString:@"descc2222 test!"]];
	
    BFRImageViewController *imageVC = [[BFRImageViewController alloc] initWithImageSource:@[]];
	[imageVC setDisableSharingLongPress:YES];
    [self presentViewController:imageVC animated:YES completion:nil];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[imageVC recieveImageSourcesDelayed:@[a,b,c]];
	});
}

#pragma mark - 3D Touch
- (void)check3DTouch {
    if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)] && self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
	EEPhoto * a = [[EEPhoto alloc]init];
	[a setUrl:[NSURL URLWithString:@"https://i.imgur.com/XDWafFs.mp4"]];
	[a setTitle:[[NSAttributedString alloc] initWithString:@"Title test!"]];
	[a setDescription:[[NSAttributedString alloc] initWithString:@"Title test!"]];
    return [[BFRImageViewController alloc] initWithImageSource:@[a]];
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self presentViewController:viewControllerToCommit animated:YES completion:nil];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)] && self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self check3DTouch];
    }
}

#pragma mark - Misc 
- (void)addImageButtonToView {
    UIButton *openImageFromURL = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    openImageFromURL.translatesAutoresizingMaskIntoConstraints = NO;
    [openImageFromURL setTitle:@"Open Image" forState:UIControlStateNormal];
    [openImageFromURL addTarget:self action:@selector(openImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openImageFromURL];
    [openImageFromURL.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [openImageFromURL.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}
@end
