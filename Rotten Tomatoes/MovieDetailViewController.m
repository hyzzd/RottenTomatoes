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

    self.title = self.movie[@"title"];

    NSString *url = [self.movie valueForKeyPath:@"posters.thumbnail"];
    url = [url stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
//    [self.posterView setImageWithURL:[NSURL URLWithString:url] placeholderImage:self.lowResImage];

    [self.posterView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] placeholderImage:self.lowResImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [UIView transitionWithView:self.posterView duration:1.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.posterView setImage:image];
        } completion:nil];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
    }];

    self.synopsisLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.scrollView.frame.size.width - 20, self.scrollView.frame.size.height)];
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
    self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.frame.size.height - 50, 0, 50, 0);

    [self.scrollView addSubview:self.synopsisBackground];
    [self.scrollView addSubview:self.synopsisLabel];

    CGPoint bottomOffset = CGPointMake(0, -self.scrollView.contentInset.top);
    [self.scrollView setContentOffset:bottomOffset animated:YES];
}

@end
