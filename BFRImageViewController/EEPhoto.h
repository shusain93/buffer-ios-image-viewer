//
//  EEPhoto.h
//  BFRImageViewer
//
//  Created by Salman Husain on 7/3/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EEPhoto : NSObject
@property (strong,nonatomic) NSURL* url;
@property (strong,nonatomic,nullable) NSAttributedString* title;
@property (strong,nonatomic,nullable) NSAttributedString* description;
@end

NS_ASSUME_NONNULL_END
