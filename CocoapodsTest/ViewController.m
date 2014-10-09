//
//  ViewController.m
//  CocoapodsTest
//
//  Created by Ben Norris on 10/8/14.
//  Copyright (c) 2014 BSN Design. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <UIImageView+AFNetworking.h>

@interface ViewController () <NSURLSessionDownloadDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // NSURLSession Data Taks
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"JSON: %@",json);
//        NSLog(@"Result Count: %@",json[@"resultCount"]);
//        NSLog(@"Artist: %@",json[@"results"][0][@"artistName"]);
//    }];
//    [dataTask resume];
    
    // AFNetworking Data
//    AFHTTPSessionManager *session = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://itunes.apple.com/"]];
//    NSDictionary *parameters = @{@"term":@"apple", @"media":@"software"};
//    [session POST:@"search" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"Response: %@",responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
    
    
    // NSURLSession Download
//    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
//    
//    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:@"http://i57.tinypic.com/2qlejop.jpg"]];
//    
//    [downloadTask resume];
    
    // This one line is from the category from AFNetworking
    [self.imageView setImageWithURL:[NSURL URLWithString:@"http://i57.tinypic.com/2qlejop.jpg"]];
}

#pragma mark - NSURLSession Download Task

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressView setHidden:YES];
        [self.imageView setImage:[UIImage imageWithData:data]];
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressView setProgress:progress];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
