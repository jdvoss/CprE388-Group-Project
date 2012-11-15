//
//  Game.h
//  Word Chain
//
//  Created by Jamison Voss on 11/14/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChainHolder.h"

@interface Game : NSObject

@property (nonatomic, retain) ChainHolder* chainHolder;
@property (nonatomic, retain) NSString* partner;
@property (nonatomic) NSInteger totalScore;

@end
