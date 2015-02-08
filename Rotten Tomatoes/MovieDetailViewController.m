//
//  MovieDetailViewController.m
//  Rotten Tomatoes
//
//  Created by Neal Wu on 2/4/15.
//  Copyright (c) 2015 Neal Wu. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *url = [self.movie valueForKeyPath:@"posters.thumbnail"];
    url = [url stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
    [self.posterView setImageWithURL:[NSURL URLWithString:url] placeholderImage:self.lowResImage];

    self.synopsisLabel.text = self.movie[@"synopsis"];
}

@end
