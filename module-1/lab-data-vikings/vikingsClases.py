
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


class Saxon(Soldier):

	def receiveDamage(self, damage):
		Soldier.receiveDamage(self,damage)
		if self.health > 0:
			return "A Saxon has received {} points of damage".format(damage)
		return("A Saxon has died in combat")

# War


class War:
    # vikingos pelean sajones
    def __init__(self,):
    	War.vikingArmy = []
    	War.saxonArmy = []

    def addViking(self, viking):
    	War.vikingArmy.append(viking)


    def addSaxon(self, saxon):
    	War.saxonArmy.append(saxon)


    def vikingAttack(self):
    	random_index = randint(0, len(War.saxonArmy))
    	viking = random.choice(War.saxonArmy)

    	War.saxonArmy[random_index].receiveDamage(viking.strength)

    	return ''

    def saxonArmyAttack(self):
    	random_index = randint(0, len(War.vikingArmy))
    	viking = random.choice(War.saxonArmy)

    	War.saxonArmy[random_index].receiveDamage(viking.strength)