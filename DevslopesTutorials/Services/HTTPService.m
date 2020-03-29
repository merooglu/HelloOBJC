//
//  HTTPService.m
//  DevslopesTutorials
//
//  Created by Mehmet Eroğlu on 27.03.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORİALS "/tutorials"

@implementation HTTPService

+(id)instance {
    static HTTPService *sharedIntance = nil;
    
    @synchronized (self) {
        if (sharedIntance == nil)
            sharedIntance = [[self alloc]init];
    }
    
    return sharedIntance;
}

-(void)getTutorials:(nullable onComplete)complitionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORİALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                NSLog(@"JSON: %@",json.debugDescription);
                complitionHandler(json, nil);
            } else {
                complitionHandler(nil, @"Data is corrupt. Please try again");
            }
        } else {
            NSLog(@"Network Err: %@", error.debugDescription);
            complitionHandler(nil, @"Problem is connecting to server");
        }
    }] resume];
}

@end
