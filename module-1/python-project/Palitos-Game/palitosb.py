class manos:
    def __init__(self, nombre):
        self.nombre = nombre
        self.dedos = [1,1]
        self.manos = ['I','D']
    
    def ataque(self, jugador2, mano_ataque, mano_defensa): #jugador2 debe ser una instacia de manos. las manos 0 o 1.
        jugador2.dedos[mano_defensa] += self.dedos[mano_ataque]
        
        if jugador2.dedos[mano_defensa] >= 5:
            jugador2.dedos[mano_defensa]-=5
        
        return "{} mano {}, ATACA a {} mano {}\n".format(self.nombre, self.manos[mano_ataque], jugador2.nombre, self.manos[mano_defensa])
    
        list.index(element)
        
def score(jug1, jug2): #Los jugadores deben ser instancias de la clase manos.
    return 'SCORE\n{}:\nmano_I: {} , mano_D: {}\n{}:\nmano_I: {} , mano_D: {}'.format(jug1.nombre, jug1.dedos[0], jug1.dedos[1], jug2.nombre, jug2.dedos[0], jug2.dedos[1])
    
def check_win(jug1, jug2): #revisar si algunode los jugadores se queda con 0s
    sum_jug1 = sum(jug1.dedos) 
    sum_jug2 = sum(jug2.dedos)
    
    if (sum_jug1 == 0) or (sum_jug2 == 0):
        return True
    else:
        return False
    
def check_who_win(jug1, jug2):
    sum_jug1 = sum(jug1.dedos) 
    sum_jug2 = sum(jug2.dedos)
    
    if sum_jug1 > sum_jug2:
        return jug1.nombre
    else:
        return jug2.nombre
    
    