//
//  GameDetailViewController.h
//  Word Chain
//
//  Created by Jamison Voss on 11/14/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameDetailViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *opponentLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *whosTurnLabel;

@property (nonatomic, retain) NSString* opponent;
@property (nonatomic) NSInteger score;
@property (nonatomic, retain) NSString* turn;

@end
