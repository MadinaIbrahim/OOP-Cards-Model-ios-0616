//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Madina Ibrahim on 6/20/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard()

@property(strong, nonatomic, readwrite) NSString *suit;
@property(strong, nonatomic, readwrite) NSString *rank;
@property(strong, nonatomic, readwrite) NSString *cardLabel;
@property(nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

- (instancetype)init {
    
    return [self initWithSuit:@"!" rank:@"N"];  // Override the default initializer init
    // to call the designated initializer while passing in @"!" as the suit argument
    // and @"N" as the rank argument.
    
}
// the implementation for the designated initializer
- (instancetype)initWithSuit:(NSString *)suit
                        rank:(NSString *)rank {
    self = [super init];
    if (self) {
        _rank = rank;// setting ivars for _rank and _suit
        _suit = suit;
        // Assigning _cardLabel and _cardValue in initWithSuit initializer.
        _cardLabel = [NSString stringWithFormat:@"%@%@", suit, rank];
        // _cardLabel should include the suit and rank properties together
        // in such a way that the Queen of Spades will show ♥Q
        // and the Ten of Diamonds will show ♦10.
        _cardValue = [self TheCardValue:@[@"A",@"2", @"3", @"4", @"5",@"6", @"7", @"8", @"9",@"10", @"J", @"Q", @"K"] whatRank: rank];
        //_cardValue will need to be 1 for an Ace,
        // the face value of the numbered cards (i.e. 2 for a Two and 10 for a Ten),
        // and 10 for the face cards (i.e. Jack, Queen, and King).
    }
    return self;
    
}

- (NSUInteger)TheCardValue:(NSArray *)theRanks whatRank:(NSString *)rank{
    NSUInteger cardValue = [theRanks indexOfObject:rank]+1;
    // indexOfObject Returns the lowest index
    //whose corresponding array value is equal to a given object.
    if (cardValue > 9) {
        cardValue = 10;
    }
    return cardValue;
}

+(NSArray *)validSuits{
    
    return @[@"♠",@"♥", @"♣", @"♦"];
    
}

+(NSArray *)validRanks{
    
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
//  the implementation for the validRanks class method to return an array
}

- (NSString *)description {
    return self.cardLabel;
}



@end
