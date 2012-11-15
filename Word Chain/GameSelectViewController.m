//
//  GameSelectViewController.m
//  Word Chain
//
//  Created by Jamison Voss on 11/14/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import "GameSelectViewController.h"

@interface GameSelectViewController ()

@end

@implementation GameSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView* scView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 320 , 380)];
    [scView setContentSize:CGSizeMake(565, 350)];
    scView.scrollEnabled = YES;
    scView.delegate = self;
    
    UIImage* wcImage = [UIImage imageNamed:@"WordChain.png"];
    UIImageView* wcImageView = [[UIImageView alloc] initWithImage:wcImage];
    [wcImageView setFrame:CGRectMake(60, 40, wcImage.size.width, wcImage.size.height)];
    wcImageView.userInteractionEnabled = YES;
    
    UIImageView* trImageView = [[UIImageView alloc] initWithImage:wcImage];
    [trImageView setFrame:CGRectMake(305, 40, wcImage.size.width, wcImage.size.height)];
    
    UITapGestureRecognizer* imageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(launchWordChain:)];
    [wcImageView addGestureRecognizer:imageTap];
    
    [scView addSubview:wcImageView];
    [scView addSubview:trImageView];
    
    [self.view addSubview:scView]; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)launchWordChain:(id)sender {
    [self performSegueWithIdentifier:@"launchWordChain" sender:nil];
}

- (IBAction)launchTRex:(UIButton *)sender {
}
 
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.scrollStartPosition = scrollView.contentOffset.x;
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentOffset.x > self.scrollStartPosition) {
        [scrollView setContentOffset:CGPointMake(245, 0) animated:YES];
    }
    else {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [scrollView setContentOffset:scrollView.contentOffset animated:YES];
    if (scrollView.contentOffset.x > self.scrollStartPosition) {
        [scrollView setContentOffset:CGPointMake(245, 0) animated:YES];
    }
    else {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }

}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
  //  NSLog(@"%f", scrollView.contentOffset.x);
}
@end
