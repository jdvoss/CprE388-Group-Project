//
//  WordChainGameSelectViewController.h
//  Word Chain
//
//  Created by Jamison Voss on 11/15/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "WordChainViewController.h"

@interface WordChainGameSelectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, GKPeerPickerControllerDelegate>

@property (nonatomic, retain) UITableView* tableView;
@property (nonatomic, retain) NSArray* games;

- (IBAction)newGame:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

@end
