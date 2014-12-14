//
//  FirstViewController.m
//  Tomatoes
//
//  Created by Kristen on 12/13/14.
//  Copyright (c) 2014 Kristen Sundquist. All rights reserved.
//

#import "FirstViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "MovieCell.h"

@interface FirstViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *movies;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
        self.movies = (NSArray *) responseObject[@"movies"];
        [self.tableView reloadData];
    }];
    
    [task resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    NSDictionary *movieInfo = self.movies[indexPath.row];
    cell.titleLabel.text = movieInfo[@"title"];
    cell.synopsisLabel.text = movieInfo[@"synopsis"];
    
    NSString *imageUrlString = movieInfo[@"posters"][@"thumbnail"];
    
    [cell.movieImageView setImageWithURL:[NSURL URLWithString:imageUrlString]];
     
    return cell;
}

@end
