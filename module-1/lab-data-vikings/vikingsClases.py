from random import *

# Soldier
class Soldier:
    def __init__(self, health=100, strength = 10):
        self.health = health
        self.strength = strength

    def attack(self):
        return self.strength

    def receiveDamage(self, damage):
        self.health = self.health - damage
# End Soldier

# Viking
class Viking(Soldier):
    def __init__(self, name, health, strength):
        Soldier.__init__(self, health=300, strength = 150)
        self.name = name

    def receiveDamage(self, damage):
        Soldier.receiveDamage(self, damage)
        if self.health > 0:
            return '{} has received {} points of damage'.format(self.name, damage)
        return '{} has died in act of combat'.format(self.name)

    def battleCry(self):
        return 'Odin Owns You All!'
# End Viking

# Saxon
class Saxon(Soldier):
    def receiveDamage(self, damage):
        Soldier.receiveDamage(self, damage)
        if self.health > 0:
            return 'A Saxon has received {} points of damage'.format(damage)
        return 'A Saxon has died in combat'
# End Saxon

# War
class War:
    def __init__(self):
        War.vikingArmy = []
        War.saxonArmy = []

    def addViking(self, viking):
        War.vikingArmy.append(viking)

    def addSaxon(self, saxon):
        War.saxonArmy.append(saxon)

    def vikingAttack(self):
        random_index = randint(0,len(War.saxonArmy)-1)
        viking = choice(War.vikingArmy)

        War.saxonArmy[random_index].receiveDamage(viking.strength)

        if War.saxonArmy[random_index].health <= 0:
            War.saxonArmy.pop(random_index)
            return 'A Saxon has died in combat'

    def saxonAttack(self):
        random_index = randint(0,len(War.vikingArmy)-1)
        saxon = choice(War.saxonArmy)

        War.vikingArmy[random_index].receiveDamage(saxon.strength)

        if War.vikingArmy[random_index].health <= 0:
            War.vikingArmy.pop(random_index)
            return

        return War.vikingArmy[random_index].name + ' has received ' + str(saxon.strength) + ' points of damage'

    def showStatus(self):
        if len(War.saxonArmy) == 0:
            return 'Vikings have won the war of the century!'
        if len(War.vikingArmy) == 0:
            return 'Saxons have fought for their lives and survive another day...'
        if len(War.saxonArmy) > 0 and len(War.vikingArmy) > 0:
            return 'Vikings and Saxons are still in the thick of battle.'
