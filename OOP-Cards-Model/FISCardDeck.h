//  FISCardDeck.h
//  OOP-Cards-Model
//
//  Created by Madina Ibrahim on 6/20/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISCardDeck : NSObject

@property(strong, nonatomic)NSMutableArray *remainingCards;
@property(strong, nonatomic)NSMutableArray *dealtCards;


-(FISCard *)drawNextCard;
-(void)resetDeck;
-(void)gatherDealtCards;
-(void)shuffleRemainingCards;

//Define all of the declared methods to default implementations.

-(instancetype)init;

@end

