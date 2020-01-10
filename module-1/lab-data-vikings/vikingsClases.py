
# Soldier


class Soldier:
    def __init__(self, health=100, strength=20):
    	self.health = health
    	self.strength = strength

    def attack(self):
    	return self.strength

    def receiveDamage(self, damage):
    	self.health = self.health -damage

# Viking


class Viking(Soldier):
    def __init__(self,name,health, strength):
    	Soldier.__init__(self, health=300, strength=150)
    	self.name = name

    def receiveDamage(self, damage):
    	Soldier.receiveDamage(self , damage)
    	if self.health > 0:
    		return "{} has received {} points of damage".format(self.name , damage)

    	return "{} has died in act of combat".format(self.name)

    def battleCry(self):
    	return "Odin Owns You All!"

# Saxon


class Saxon:
    pass

# War


class War:
    pass
