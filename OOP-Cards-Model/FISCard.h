
//  FISCard.h
//  OOP-Cards-Model
//
//  Created by Madina Ibrahim on 6/20/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

//  FISCard.h
#import <Foundation/Foundation.h>

@interface FISCard : NSObject









//  propeties
@property(strong, nonatomic, readonly) NSString *suit;
@property(strong, nonatomic, readonly) NSString *rank;
@property(strong, nonatomic, readonly) NSString *cardLabel;
@property(nonatomic, readonly) NSUInteger cardValue;


//   class methods '+'
+(NSArray *)validSuits;
+(NSArray *)validRanks;

//   designated initializer for setting up read-only properties that cannot be written to from outside the class. Allows a user of that class to provide an initial value for those read-only properties upon creating an instance. Providing an initializer allows the class to ensure that instances have the information they need to behave appropriately from their creation.
-(instancetype)init;
-(instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank;

@end
