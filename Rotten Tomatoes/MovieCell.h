//
//  MovieCell.h
//  Rotten Tomatoes
//
//  Created by Neal Wu on 2/4/15.
//  Copyright (c) 2015 Neal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end
