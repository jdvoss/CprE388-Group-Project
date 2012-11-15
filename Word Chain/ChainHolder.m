//
//  ChainHolder.m
//  Word Chain
//
//  Created by Jamison Voss on 11/13/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import "ChainHolder.h"

@implementation ChainHolder

- (id) init {
    if (self = [super init]) {
        self.chain = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString*) getCorrectLetters {
    NSString* ret = @"";
    
    for (int i = 0; i < self.guess.length; i++) {
        char c = [self.guess characterAtIndex:i];
        NSString* s = [NSString stringWithFormat:@"%c", c];
        NSRange range = [self.response rangeOfString:s];
        if (range.location != NSNotFound) {
            ret = [ret stringByAppendingString:s];
        }
    }
    
    
    return ret;
}

- (BOOL) isCorrectGuess {
    if ([self.guess isEqualToString:self.response]) {
        return YES;
    }
    return NO;
}

- (void) newWordResponse {
    self.guess = @"";
    self.response = @"";
}
@end
