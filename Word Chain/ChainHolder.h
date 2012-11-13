//
//  ChainHolder.h
//  Word Chain
//
//  Created by Jamison Voss on 11/13/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChainHolder : NSObject

@property (nonatomic, retain) NSMutableArray* chain;

@property (nonatomic, retain) NSString* guess;
@property (nonatomic, retain) NSString* response;
@property (nonatomic, retain) NSString* root;

- (NSString*) getCorrectLetters;
- (BOOL) isCorrectGuess;
- (void) newWordResponse;

@end
