import pygame 
import sys
import random

ancho = 800
alto = 600
color_rojo = (255,0,0)
color_negro = (0,0,0)
color_azul = (0,0,255)

size_player = 50
pos_player = [ancho / 2,alto - size_player * 2]

enemy_size = 50
enemigo_pos = [random.randint(0,ancho - enemy_size),0]

window = pygame.display.set_mode((ancho,alto))

game_over = False
clock = pygame.time.Clock()


def colision(pos_player,enemigo_pos):
    jx = pos_player[0]
    jy = pos_player[1]
    ex = enemigo_pos[0]
    ey = enemigo_pos[1]
    
    if (ex >= jx and ex <(jx + size_player)) or (jx >= ex and jx < (ex + enemy_size)):
        if (ey >= jy and ex <(jy + size_player)) or (jy >= ey and jy < (ey + enemy_size)):
            return True
    return False

while not game_over:
    for event in pygame.event.get():
        
        if event.type == pygame.QUIT:
            sys.exit()
        if event.type == pygame.KEYDOWN:
            x = pos_player[0]
            if event.key == pygame.K_LEFT:
                x -= size_player    
            if event.key == pygame.K_RIGHT:
                x += size_player
                
            pos_player[0] = x
            
    
    
    window.fill(color_negro)    
    
    
    if enemigo_pos[1] >= 0 and enemigo_pos[1]< alto:
        enemigo_pos[1] += 20
    else:
        enemigo_pos[0] = random.randint(0,ancho - enemy_size)
        enemigo_pos[1] =0
    
    if colision(pos_player,enemigo_pos):
        game_over = True
    
    
    pygame.draw.rect(window, color_azul,(enemigo_pos[0], enemigo_pos[1], enemy_size,enemy_size))
    
    pygame.draw.rect(window, color_rojo,(pos_player[0],pos_player[1],size_player,size_player))
   
    clock.tick(30)
    pygame.display.update()
    