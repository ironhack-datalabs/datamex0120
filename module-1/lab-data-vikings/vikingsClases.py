
# Soldier
class Soldier:
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
        
    def attack(self):
        return self.strength
        
    def receiveDamage(self, damage):
        self.health = self.health - damage
    
# Viking
class Viking(Soldier):
    def __init__(self, name, health, strength):
        self.name = name
        self.health = health
        self.strength = strength
    
    def receiveDamage(self, damage):
        self.health = self.health - damage
        return "{} has received {} points of damage".format(self.name, damage) if self.health >0 else "{} has died in act of combat".format(self.name)
    
    def battleCry(self):
        return "Odin Owns You All!"


# Saxon
class Saxon(Soldier):    
    def receiveDamage(self,damage):
        self.health = self.health - damage
        return "A Saxon has received {} points of damage".format(damage) if self.health >0 else "A Saxon has died in combat"
            
# War
class War:
    def __init__(self):
        self.vikingArmy = []
        self.saxonArmy = []
    
    def addViking(self, Viking):
        self.vikingArmy.append(Viking)
        
    def addSaxon(self, Saxon):
        self.saxonArmy.append(Saxon)
        
    def vikingAttack(self):
        self.saxonArmy[0].receiveDamage(self.vikingArmy[0].attack())
        if self.saxonArmy[0].health <= 0:
            self.saxonArmy.pop(0)
        
    def saxonAttack(self):
        self.vikingArmy[0].receiveDamage(self.saxonArmy[0].attack())
        if self.vikingArmy[0].health <= 0:
            self.vikingArmy.pop(0)
        
        
    def showStatus(self):
        if len(self.saxonArmy) == 0:
            return print('Vikings have won the war of the century!')
        if len(self.vikingArmy) == 0:
            return print('Saxons have fought for their lives and survive another day...')
        
