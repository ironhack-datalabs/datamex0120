# -*- coding: utf-8 -*-

# Soldier
class Soldier:
    def __init__(self, health, strength):
        self.health=health
        self.strength=strength
        # add code here

    def attack(self):
        return self.strength
    
    def receiveDamage(self,damage):
        self.health-=damage


#Viking
class Viking(Soldier):
    pass
    
    def __init__(self,name,health,strength):
        self.name=name
        self.health=health
        self.strength=strength

    def receiveDamage(self,damage):
        self.health=self.health-damage
        if self.health>0:
            return("{} has received {} points of damage".format(self.name,str(damage)))
        else:
            return("{} has died in act of combat".format(self.name))
    
    def battleCry(self):
        return "Odin Owns You All!"

#Saxon
class Saxon(Soldier):
    pass
    
    def __init__(self,health,strength):
        self.health=health
        self.strength=strength

    def receiveDamage(self,damage):
        self.health=self.health-damage
        if self.health>0:
            return("A Saxon has received {} points of damage".format(str(damage)))
        else:
            return("A Saxon has died in combat")

#War...Actually I had not time to test this bonus...
#Hope you can let me know my mistakes. Thanks beforehand....
class War:
    def __init__(self):
        self.vikingArmy=[]
        self.saxonArmy=[]
        

    def addViking(self,viking):
        self.vikingArmy.append(viking)
        
    def addSaxon(self,saxon):
        self.saxonArmy.append(saxon)
    
    def vikingAttack(self):
        self.saxon.receiveDamage(self.viking.vikingAttack)
        
    
    def saxonAttack(self):
        self.viking.receiveDamage(self.saxon.saxonAttack)
    
    def showStatus(self):
        if len(self.saxonArmy)==0 and len(self.vikingArmy)>0:
            return ("Vikings have won the war of the century!")
        elif len(self.saxonArmy)>0 and len(self.vikingArmy)==0:
            return ("Saxons have fought for their lives and survive another day...")
        else:
            return("Vikings and Saxons are still in the thick of battle.")