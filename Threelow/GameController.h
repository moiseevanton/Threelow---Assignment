//
//  GameController.h
//  Threelow
//
//  Created by Anton Moiseev on 2016-05-04.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "Collector.h"

@interface GameController : NSObject

@property NSArray *fiveDiceArray;

@property NSMutableSet *diceYouHold;

@property NSMutableSet *unheldDice;

-(void)holdDie:(int)inputInteger;

-(void)unholdDie:(int)inputInteger;

-(NSString *)inputForPrompt:(NSString *)promptString;

-(NSMutableString *)showAllDice;

-(int)currentScore;

-(void)printTheCurrentState;

-(void)resetDice;

@end
