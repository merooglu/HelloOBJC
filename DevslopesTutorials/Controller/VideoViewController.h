//
//  VideoViewController.h
//  DevslopesTutorials
//
//  Created by Mehmet Eroğlu on 27.03.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

NS_ASSUME_NONNULL_BEGIN
@class Video;
@interface VideoViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) Video *video;
@end

NS_ASSUME_NONNULL_END
