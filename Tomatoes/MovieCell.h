//
//  MovieCell.h
//  Tomatoes
//
//  Created by Kristen on 12/13/14.
//  Copyright (c) 2014 Kristen Sundquist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end
