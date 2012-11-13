//
//  FirstViewController.h
//  Word Chain
//
//  Created by Jamison Voss on 11/8/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "ChainHolder.h"

@interface FirstViewController : UIViewController <GKPeerPickerControllerDelegate, GKSessionDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UITextField *responseField;
@property (nonatomic, strong) NSMutableArray* strings;

@property (nonatomic, strong) GKPeerPickerController* picker;
@property (nonatomic, strong) GKSession* session;
@property (nonatomic, strong) NSString* peerID;

@property (nonatomic, retain) ChainHolder* chainHolder;

- (IBAction)action:(UIButton *)sender;

@end
