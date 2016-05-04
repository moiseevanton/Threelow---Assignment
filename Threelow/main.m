//
//  main.m
//  Threelow
//
//  Created by Anton Moiseev on 2016-05-04.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "Collector.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    
    GameController *theGame = [[GameController alloc] init];
    NSString *inputString = [theGame inputForPrompt:@"\nHey there! Welcome to Threelow! Let's play!\nHere are the options available to you throughout the game:\n\n-roll (rolls the unheld dice)\n-hold (hold a dice only after you roll)\n-unhold (unhold a dice only after you rool)\n-quit (the game stops completely)\n\nWhat do you want to do?"];
    
    while (YES) {
        
        if([inputString isEqualToString:@"roll"]) {
            
            NSMutableSet *unheldDice = [NSMutableSet setWithArray:theGame.fiveDiceArray];
            [unheldDice minusSet:theGame.diceYouHold];
            
            for (Dice *eachDie in unheldDice) {
                
                [eachDie roll];
                    
                }
            
            [theGame printTheCurrentState];
            
            
            NSString *input = [theGame inputForPrompt:@"\nWhat die do you want to hold? You must hold a minimum of one die every time you roll. Enter the index of the die you want to hold, enter unhold <index of the die>, enter reset to unhold all dice, or enter done if you're done."];
            
            while ([input isNotEqualTo:@"done"]){
                
                if ([input containsString:@"unhold"]) {
                    
                    NSArray *i = [input componentsSeparatedByString:@"unhold "];
                    NSMutableSet *unheldDice = [NSMutableSet setWithArray:theGame.fiveDiceArray];
                    [unheldDice minusSet:theGame.diceYouHold];
                    
                    if ([unheldDice containsObject:theGame.fiveDiceArray[[i[1] intValue]]]) {
                        
                        NSLog(@"You're not holding that die!");
                        [theGame printTheCurrentState];
                        
                    } else {
                        
                        [theGame unholdDie:[i[1] intValue]];
                        [theGame printTheCurrentState];
                    }
                    
                } else if ([input isEqualToString:@"reset"]) {
                    
                    [theGame resetDice];
                    [theGame printTheCurrentState];
                    
                } else if ([input isEqualToString:@"quit"]) {
                    
                    
                    break;
                    
                }else if ([theGame.diceYouHold containsObject:theGame.fiveDiceArray[[input intValue]]]){
                    
                    NSLog(@"You're holding that die already!");
                    [theGame printTheCurrentState];

                    
                } else {
                    
                    int diceIndex = [input intValue];
                    [theGame holdDie:diceIndex];
                    [theGame printTheCurrentState];
                    
                    
                    
                }
                input = [theGame inputForPrompt:@"Enter the index of the die you want to hold, enter unhold <index of the die>, enter reset to unhold all dice, or enter done if you're done."];
            }
            
            if ([input isNotEqualTo:@"quit"]) {
                inputString = [theGame inputForPrompt:@"What do you want to do next?"];
            } else {
                
                inputString = input;
            }
            

                
        } else if ([inputString isEqualToString:@"quit"]) {
            
            NSLog(@"Bye bye!");
            NSLog(@"Your current score: %d", [theGame currentScore]);
            break;
            
        }

    }
    return 0;
}

