//
//  Dice.m
//  Threelow
//
//  Created by Anton Moiseev on 2016-05-04.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(void)roll {
    
    int r = arc4random_uniform(6);
    
    self.value = r;
    
}

-(NSString *)showValue {
    
    NSArray *diceArray = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    return diceArray[self.value];
    
}

@end
