# -*- coding: utf-8 -*-
"""
Created on Sun Jan 12 22:14:36 2020

@author: Arturo
"""
import random

#The cadr class is created...
class Card(object):
    #Initiating the class...
    def __init__(self, suit,val):
        self.suit=suit
        self.value=val
    
    #Show method in roder to present each card...
    def show(self):
        print("{} of {}".format(self.value, self.suit))

#Definition of Deck class...
class Deck(object):
    def __init__(self):
        self.cards=[]
        self.build()
    
    #Building of the complete set of cards...
    def build(self):
        for s in ["Spades","Clubs","Diamonds","Hearts"]:
            for v in range(1,11):
                #Here it was modified from just the Card class
                #to a list with the card class and the value from the card...
                self.cards.append([Card(s,v),v])
    
    #This is the show method for showing the cards...
    def show(self):
        for c in self.cards:
            #Here is presented the Card class as is conformed...
            c[0].show()
            
    #This is the method to sort the cards
    def shuffle(self):
        for i in range(len(self.cards)-1,0,-1):
            r=random.randint(0,i)
            self.cards[i], self.cards[r]=self.cards[r], self.cards[i]
    
    #A card is taken from the top of the sorted pack...
    def drawCard(self):
        return self.cards.pop()

#Here is generated the payer class for player and for the dealer...
class Player(object):
    def __init__(self,name):
        self.name=name
        self.hand=[]
        self.total=[]
    
    #In this method it is added a card to the hand of the players...
    def draw(self, deck):
        self.hand.append(deck.drawCard())
        return self
    
    #In this method there are shown the cards from a hand...
    def showHand(self):
        for card in self.hand:
            #card.show()
            card[0].show()
    
    #In this method is made the sum of the points in the hand of
    #each player...
    def points(self):
        self.total=[]
        for card in self.hand:
            self.total.append(card[1])
        return sum(self.total)
        
    #This one is no useful for this game because it is for useless cards
    #in other card games...
    def discard(self):
        return self.hand.pop()

#BlackJack.....
#The game just started...
print('Welcome, it is time to play!!!')
#The game deck is prepared (creating the card pack)...
deck=Deck()
#The cards are sorted...
deck.shuffle()
#deck.show()

#Dealer cards...
#The game is open (the dealer shows his cards from the start)...
dealer=Player("Dealer")
while len(dealer.hand)!=2:
    dealer.draw(deck)
    if len(dealer.hand)==2:
        print("Dealer has gotten: ")
        dealer.showHand()

#Player cards...
player=Player("Player")
while len(player.hand)!=2:
    player.draw(deck)
    if len(player.hand)==2:
        print("You have: ")
        player.showHand()

print('\n')
#print(player.points())

#Comparison of points for each hand...
while player.points()<21:
    action_taken =input("Do you want to stay or hit? ")
    if action_taken=="hit":
        player.draw(deck)
        print("You now have a total of: {} ".format(player.points()))
        print("from these cards: \n")
        player.showHand()
    else:
        print("The dealer has a total of: {} ".format(dealer.points()))
        print("you have a total of: {}".format(player.points()))
        if dealer.points()>player.points():
            print("Dealer wins!!!")
        else:
            print("You win!!!")
            break

print(player.points())
if player.points()>21:
    print("You BUSTED!!! Dealer wins")
elif player.points()==21:
    print("You GOT BLACKJACK!!! you win! 21")


