
# Soldier


class Soldier:
    def __init__(self, health=100, strength = 10):
        self.health = health
        self.strength = strength

    def attack(self):
        return self.strength

    def receiveDamage(self, damage):
        self.health = self.health - damage

# Viking


class Viking:
    pass

# Saxon


class Saxon:
    pass

# War


class War:
    pass
