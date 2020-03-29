//
//  VideoTVCell.h
//  DevslopesTutorials
//
//  Created by Mehmet Eroğlu on 27.03.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Video;

@interface VideoTVCell : UITableViewCell
-(void)updateUI:(nonnull Video*)video;
@end

NS_ASSUME_NONNULL_END
