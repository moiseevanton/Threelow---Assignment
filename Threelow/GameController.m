//
//  GameController.m
//  Threelow
//
//  Created by Anton Moiseev on 2016-05-04.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#import "Collector.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fiveDiceArray = @[[[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init]];
        _diceYouHold = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void)holdDie:(int)inputInteger {
    
    [self.diceYouHold addObject:self.fiveDiceArray[inputInteger]];
    
}

-(void)unholdDie:(int)inputInteger {
    
    [self.diceYouHold removeObject:self.fiveDiceArray[inputInteger]];
    
}

-(NSString *)inputForPrompt:(NSString *)promptString {
    
    NSLog(@"%@", promptString);
    char string[255];
    fgets(string, 255, stdin);
    NSString *inputString = [NSString stringWithUTF8String:string];
    inputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return inputString;
    
}

-(NSMutableString *)showAllDice {
    
    
    NSMutableString *allDice = [[NSMutableString alloc] init];
    
    for (Dice *eachDie in self.fiveDiceArray) {
        
        if ([self.diceYouHold containsObject:eachDie]) {
            
            NSString *die = [NSString stringWithFormat:@" [%@] ", eachDie.showValue];
            
            [allDice appendString:die];
            
        } else {
            
            NSString *die = [NSString stringWithFormat:@" %@ ", eachDie.showValue];
            
            [allDice appendString:die];
            
        }
    }
    
    return allDice;
    
}

-(void)printTheCurrentState {
    
    NSLog(@"%@", [self showAllDice]);
    NSLog(@"Your current score: %d", [self currentScore]);
    
}

-(void)resetDice {
    
    [self.diceYouHold removeAllObjects];
    
}

-(int)currentScore {
    
    int score = 0;
    
    for (Dice *eachDie in self.diceYouHold) {
        
        if ([eachDie.showValue isEqualToString:@"⚀"]) {
            
            score += 1;
            
        } else if ([eachDie.showValue isEqualToString:@"⚁"]) {
            
            score += 2;
            
        } else if ([eachDie.showValue isEqualToString:@"⚂"]) {
            
            score += 0;
            
        } else if ([eachDie.showValue isEqualToString:@"⚃"]) {
            
            score += 4;
            
        } else if ([eachDie.showValue isEqualToString:@"⚄"]) {
            
            score += 5;
            
        } else if ([eachDie.showValue isEqualToString:@"⚅"]) {
            
            score += 6;
            
        }
        
    }
    
    return score;
}

@end
