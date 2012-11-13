//
//  FirstViewController.m
//  Word Chain
//
//  Created by Jamison Voss on 11/8/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.responseField.delegate = self;
    
    self.picker = [[GKPeerPickerController alloc] init]; 
    self.picker.delegate = self;
    self.picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    
    NSString* file = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"txt"];
    NSString* contents = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    self.strings = (NSMutableArray*)[contents componentsSeparatedByString:@"\r"];
    NSLog(@"%d", [self.strings count]);
    
    [self.picker show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action:(UIButton *)sender {
   
    if ([self.actionButton.titleLabel.text isEqualToString:@"Start"]) {
        int number = rand() % [self.strings count];
        self.root = (NSString*)[self.strings objectAtIndex:number];
        self.displayLabel.text = self.root;
        [self.strings removeObjectAtIndex:number];
        [self.actionButton setTitle:@"Send" forState:nil];
        return;
    }
    
    if (self.responseField.text.length == 0)
        return;
    if ([self.actionButton.titleLabel.text isEqualToString:@"Send"]) {
        self.response = [self.responseField text];
        NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
        [dict setObject:self.root forKey:@"root"];
        [dict setObject:self.response forKey:@"response"];
        
        NSMutableData *data = [[NSMutableData alloc] init];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:dict forKey:@"Dictionary"];
        [archiver finishEncoding];
        
        [self.session sendDataToAllPeers:data withDataMode:GKSendDataUnreliable error:nil];
    }
    else if ([self.actionButton.titleLabel.text isEqualToString:@"Guess"]) {
        NSLog(@"guess");
        self.guess = self.responseField.text;
        if ([self.guess isEqualToString:self.response]) {
            NSLog(@"wow");
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"WOW!" message:@"You have guessed correctly" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
            
            [alert show];
        }
    }
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@" "]) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"You must respond with single words only" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if (textField.text.length == 0)
        return NO;
    [self action:nil];
    [textField resignFirstResponder];
    return YES;
}

- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session {
    self.peerID = peerID;
    self.session = session;
    self.session.delegate = self;
    
    [self.session setDataReceiveHandler:self withContext:nil];
   
    [self.picker dismiss];
    
    [self.actionButton setHidden:NO];
    [self.responseField setHidden:NO];
}

- (void) session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID {
    self.peerID = peerID;
    self.session = session;
    NSLog(@"Waiting...");
    self.displayLabel.text = @"Waiting...";
}

- (void)session:(GKSession *)session connectionWithPeerFailed:(NSString *)peerID withError:(NSError *)error {
    NSLog(@"connection Fail");
    NSLog(@"%@", error);
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error {
    NSLog(@"fail");
    NSLog(@"%@", error);
}

- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context {
    NSLog(@"here");
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSDictionary *myDictionary = [unarchiver decodeObjectForKey:@"Dictionary"];
    [unarchiver finishDecoding];
    
    self.root = [myDictionary objectForKey:@"root"];
    self.response = [myDictionary objectForKey:@"response"];
    self.displayLabel.text = self.root;
    
    [self.actionButton setHidden:NO];
    [self.responseField setHidden:NO];
    
    [self.actionButton setTitle:@"Guess" forState:nil];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.root = self.guess;
    self.displayLabel.text = self.root;
    [self.actionButton setTitle:@"Send" forState:nil];
    self.responseField.text = @"";
    self.guess = @"";
    self.response = @"";
}

@end
