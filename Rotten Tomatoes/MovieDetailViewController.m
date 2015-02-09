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
@property (strong, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (strong, nonatomic) UIView *synopsisBackground;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *url = [self.movie valueForKeyPath:@"posters.thumbnail"];
    url = [url stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
    [self.posterView setImageWithURL:[NSURL URLWithString:url] placeholderImage:self.lowResImage];

    self.synopsisLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.scrollView.frame.size.width - 20, self.scrollView.frame.size.height)];
    self.synopsisLabel.text = self.movie[@"synopsis"];
    self.synopsisLabel.numberOfLines = 0;
    self.synopsisLabel.textColor = [UIColor whiteColor];
    [self.synopsisLabel sizeToFit];

    int width = self.synopsisLabel.frame.size.width;
    int height = self.synopsisLabel.frame.size.height;

    self.synopsisBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width + 20, height + 500)];
    self.synopsisBackground.backgroundColor = [UIColor blackColor];
    self.synopsisBackground.alpha = 0.75;

    self.scrollView.contentSize = CGSizeMake(width, height);
    self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.frame.size.height - 50, 0, 0, 0);

    [self.scrollView addSubview:self.synopsisBackground];
    [self.scrollView addSubview:self.synopsisLabel];

    CGPoint bottomOffset = CGPointMake(0, -self.scrollView.contentInset.top);
    [self.scrollView setContentOffset:bottomOffset animated:YES];

//    [self.scrollView addSubview:self.synopsisLabel];
//    CGSize maxSize = CGSizeMake(self.synopsisLabel.frame.size.width, CGFLOAT_MAX);
//    CGSize labelSize = [self.synopsisLabel sizeThatFits:maxSize];
//    self.synopsisLabel.text = self.movie[@"synopsis"];
//    [self.synopsisLabel sizeToFit];
//    self.scrollView.contentSize = [self.synopsisLabel sizeThatFits:CGSizeMake(self.synopsisLabel.frame.size.width, CGFLOAT_MAX)];
//    self.synopsisLabel.
}

@end
