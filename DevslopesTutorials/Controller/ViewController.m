//
//  ViewController.m
//  DevslopesTutorials
//
//  Created by Mehmet Eroğlu on 27.03.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoTVCell.h"
#import "VideoViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSLog(@"Dictionary: %@", dataArray.debugDescription);
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            
            for (NSDictionary *dict in dataArray) {
                Video *vid = [[Video alloc]init];
                vid.videoTitle = [dict objectForKey:@"title"];
                vid.videoDescription = [dict objectForKey:@"description"];
                vid.videoThumbnailUrl = [dict objectForKey:@"thumbnail"];
                vid.videoIframe = [dict objectForKey:@"iframe"];
                [arr addObject:vid];
            }
            
            self.videoList = arr;
            [self updateTableViewWithData];
            
        } else if (errMessage) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:errMessage preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"CLOSE" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:closeAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

-(void) updateTableViewWithData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView  reloadData];
    });
}

// MARK: - PrepareForSegue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoViewController *destinationVC = (VideoViewController*)segue.destinationViewController;
    Video *video = (Video*)sender;
    destinationVC.video = video;
}

// MARK: - TableView Delegate and DataSource Functions
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)
        return self.videoList.count;
    else
        return self.videoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoTVCell *cell = (VideoTVCell*)[tableView dequeueReusableCellWithIdentifier:@"VideoTVCell"];
    if (!cell) {
        cell = [[VideoTVCell alloc]init];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *vid = [self.videoList objectAtIndex:indexPath.row];
    VideoTVCell *vidCell = (VideoTVCell*)cell;
    [vidCell updateUI:vid];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"VideoViewController" sender:video];
}

@end
