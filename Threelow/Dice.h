//
//  Dice.h
//  Threelow
//
//  Created by Anton Moiseev on 2016-05-04.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int value;

-(void)roll;

-(NSString *)showValue;

@end
