//
//  VideoTVCell.m
//  DevslopesTutorials
//
//  Created by Mehmet Eroğlu on 27.03.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

#import "VideoTVCell.h"
#import "Video.h"

@interface VideoTVCell()
@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation VideoTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _cellView.layer.cornerRadius = 5.0;
    _cellView.layer.shadowColor = [UIColor colorWithRed:157.0 / 255.0 green:157.0 / 255.0 blue:157.0 / 255.0 alpha:0.8].CGColor;
    _cellView.layer.shadowOpacity = 1.0;
    _cellView.layer.shadowRadius = 5.0;
    _cellView.layer.shadowOffset = CGSizeMake(0.0, 2.0);
}

-(void)updateUI:(nonnull Video*)video {
    self.titleLabel.text = video.videoTitle;
    self.descriptionLabel.text = video.videoDescription;
    UIImage *thumbImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.videoThumbnailUrl]]];
    self.thumbImageView.image = thumbImage;
}

@end
