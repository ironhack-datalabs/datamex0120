import random
# Soldier
class Soldier:
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
        
    def attack(self):
        return self.strength
    
    def receiveDamage(self, damage):
        self.health= self.health - damage

# Viking
class Viking(Soldier):
    def __init__(self, name, health, strength):
        self.name = name
        self.health = health
        self.strength = strength
        
    def receiveDamage(self, damage):
        self.health = self.health - damage
        if self.health <= 0:
            return "{} has died in act of combat".format(self.name)
        else:
            return "{} has received {} points of damage".format(self.name, damage)
        
    def battleCry(self):
        return "Odin Owns You All!"

# Saxon
class Saxon(Soldier):
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
        
    def receiveDamage(self, damage):
        self.health = self.health - damage
        if self.health <= 0:
            return "A Saxon has died in combat"
        else:
            return "A Saxon has received {} points of damage".format(damage)
# War
  
class War:
    def __init__(self):
        self.vikingArmy = []
        self.saxonArmy = []
        
    def addViking(self,W_V):
        self.vikingArmy.append(W_V)
        
    def addSaxon(self,W_S):
        self.saxonArmy.append(W_S)
    
    def vikingAttack(self):
        S1 = random.choice (self.saxonArmy)
        V1 = random.choice(self.vikingArmy)
        S1_live=S1.receiveDamage(V1.strength)
        if S1.health <= 0:
            self.saxonArmy.remove(S1)
            return "A Saxon has died in combat"    
         
    def saxonAttack(self):
        S1 = random.choice(self.saxonArmy)
        V1 = random.choice(self.vikingArmy)
        V1_live=V1.receiveDamage(S1.strength)
        if V1_live.health <= 0:
            self.vikingArmy.remove(V1_live)
        else:
            return "{} has received {} points of damage".format(V1.name, S1.strength)
        
    def showStatus(self):
        if self.saxonArmy == []:
            return "Vikings have won the war of the century!"
        elif self.vikingArmy == []:
            return "Saxons have fought for their lives and survive another day..."
        elif self.saxonArmy != [] and self.vikingArmy != []:
            return "Vikings and Saxons are still in the thick of battle."