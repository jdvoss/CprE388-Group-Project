//
//  WordChainViewController.h
//  Word Chain
//
//  Created by Jamison Voss on 11/15/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "ChainHolder.h"
#import "Game.h"

@interface WordChainViewController : UIViewController <GKPeerPickerControllerDelegate, GKSessionDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UITextField *responseField;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (weak, nonatomic) IBOutlet UIButton *gameInfoButton;
@property (nonatomic, strong) NSMutableArray* strings;

@property (nonatomic, strong) GKPeerPickerController* picker;
@property (nonatomic, strong) GKSession* session;
@property (nonatomic, strong) NSString* peerID;

@property (nonatomic, retain) ChainHolder* chainHolder;
@property (nonatomic, retain) Game* game;

- (IBAction)action:(UIButton *)sender;
- (IBAction)skip:(UIButton *)sender;
- (IBAction)gameInfo:(id)sender;

@end

