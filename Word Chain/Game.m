//
//  Game.m
//  Word Chain
//
//  Created by Jamison Voss on 11/14/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import "Game.h"

@implementation Game

- (id) init {
    if (self = [super init]) {
        self.chainHolder = [[ChainHolder alloc] init];
    }
    return self;
}

@end
