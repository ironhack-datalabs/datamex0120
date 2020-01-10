import random
# Soldier
class Soldier:
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
        
    def attack(self):
        return self.strength
    
    def receiveDamage(self, damage):
        self.health -= damage



# Viking
class Viking(Soldier):
    def __init__(self, name, health, strength):
        #Soldier.__init__(self, health, strength)
        self.name = name
        self.health = health
        self.strength = strength
        
    def receiveDamage(self, damage):
        self.health -= damage
        if self.health > 0:
            return self.name+" has received "+str(damage)+" points of damage"
        else:
            return self.name+" has died in act of combat"
        
    def battleCry(self):
        return "Odin Owns You All!"
    
# Saxon
class Saxon(Soldier):
    def __init_(self, health, strengh):
        self.health = health
        self.strength = strength
    
    def receiveDamage(self, damage):
        self.health -= damage
        if self.health > 0:
            return "A Saxon has received "+str(damage)+" points of damage"
        else:
            return "A Saxon has died in combat"
        

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
        
        #print(len(self.vikingArmy))
        vik_rand = self.vikingArmy[random.randint(0,len(self.vikingArmy)-1)]
        sax_rand = self.saxonArmy[random.randint(0,len(self.saxonArmy)-1)]
        
        at_vik = vik_rand.attack()
        resp_sax = sax_rand.receiveDamage(at_vik)
        
        temp_list_s = []
        
        for i in self.saxonArmy:
            if i.health > 0:
                temp_list_s.append(i)
        self.saxonArmy = temp_list_s
        
        return resp_sax
    
    def saxonAttack(self):
        
        vik_rand = self.vikingArmy[random.randint(0,len(self.vikingArmy)-1)]
        sax_rand = self.saxonArmy[random.randint(0,len(self.saxonArmy)-1)]
        
        at_sax = sax_rand.attack()
        resp_vik = vik_rand.receiveDamage(at_sax)
        
        temp_list_v = []
        
        for i in self.vikingArmy:
            if i.health > 0:
                temp_list_v.append(i)
        self.vikingArmy = temp_list_v
        
        return resp_vik
    
    def showStatus(self):
        
        if len(self.saxonArmy)==0:
            return "Vikings have won the war of the century!"
        
        if len(self.vikingArmy)==0:
            return "Saxons have fought for their lives and survive another day..."
        
        if (len(self.saxonArmy)>0) and (len(self.vikingArmy)>0):
            return "Vikings and Saxons are still in the thick of battle."
        
        
