//
//  FirstViewController.m
//  Tomatoes
//
//  Created by Kristen on 12/13/14.
//  Copyright (c) 2014 Kristen Sundquist. All rights reserved.
//

#import "FirstViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURLSessionConfiguration *session = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:session];
    
    NSURL *url = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=95wsptzedh7yfpfx4r537zvu"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSLog(@"%@", responseObject);
    }];
    
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
