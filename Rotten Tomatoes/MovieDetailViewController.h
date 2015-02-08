//
//  MovieDetailViewController.h
//  Rotten Tomatoes
//
//  Created by Neal Wu on 2/4/15.
//  Copyright (c) 2015 Neal Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *movie;
@property (strong, nonatomic) UIImage *lowResImage;

@end
