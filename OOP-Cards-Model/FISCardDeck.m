//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Madina Ibrahim on 6/20/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck

// the default implementations of the designated initializer
// Overwrite the default initializer (init).
//Have it initialize the _remainingCards and _dealtCards ivars
//to new NSMutableArrays.
//At the end of the if (self) block,
//insert a call to your card generator helper method
//that you just declared in step 1.

-(instancetype)init {
    self = [super init];
    if (self) {
        _remainingCards = [[NSMutableArray alloc] init];
        _dealtCards = [[NSMutableArray alloc] init];
        [self generateACardDeck];
    }
    return self;
}

//the implementation for your card generator helper method.
//Think about how you can use the two arrays that you
//saved in the FISCard class methods validSuits and validRanks
//to dynamically create one unique card of each suit and rank combination.
//Add each card to the remainingCards array.

- (FISCard *)drawNextCard {
    if ([self.remainingCards count] > 0) {
        FISCard *drawCard = self.remainingCards[[self.remainingCards count] - 1];
        [self.remainingCards removeObject:drawCard];
        [self.dealtCards addObject:drawCard];
        NSLog(@"remaining:%lu dealt:%lu", [self.remainingCards count], [self.dealtCards count]);
        return drawCard;
    }
    NSLog(@"The deck is empty!");
    return nil;
}

- (void)resetDeck {
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}

- (void)gatherDealtCards {
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
}

- (void)shuffleRemainingCards {
    
    for (NSUInteger i=0; i < 100; i++) {
        NSUInteger indexFirst = arc4random_uniform((uint32_t)[self.remainingCards count]);
        NSUInteger indexSecond = indexFirst;
        while (indexSecond == indexFirst) {
            indexSecond = arc4random_uniform((uint32_t)[self.remainingCards count]);
        }
        
        [self.remainingCards exchangeObjectAtIndex:indexFirst withObjectAtIndex:indexSecond];
    }
    
    //NSMutableArray *cardsToShuffle= [self.remainingCards mutableCopy];
//    [self.remainingCards removeAllObjects];
//    NSUInteger randomCard = 0;
//    while (cardsToShuffle.count > 0)
//        randomCard = arc4random_uniform((uint32_t)cardsToShuffle.count);
//    [self.remainingCards addObject:cardsToShuffle[randomCard]];
//    [cardsToShuffle removeObjectAtIndex:randomCard];
}

- (void)generateACardDeck {
    
            NSArray *allSuits = [FISCard validSuits];
            NSArray *allRanks = [FISCard validRanks];
    
            for (NSUInteger i=0; i < [allSuits count]; i++) {
                    for (NSUInteger j=0; j < [allRanks count]; j++) {
                            FISCard *cardToAdd = [[FISCard alloc] initWithSuit:allSuits[i] rank:allRanks[j]];
                            [self.remainingCards addObject:cardToAdd];
                        }
                }
}

- (NSString *)description {
    NSString *allCards = [NSString stringWithFormat:@"count: %lu\ncards:\n", [self.remainingCards count]];
    for (FISCard *eachCard in self.remainingCards) {
        allCards = [allCards stringByAppendingString:[NSString stringWithFormat:@"%@ ",eachCard.description]];
    }
    return allCards;
}

@end