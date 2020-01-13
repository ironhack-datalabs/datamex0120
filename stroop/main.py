import pygame
import random
#from pygame import mixer

# Constants
RED = (255,0,0)
GREEN = (0,255,0)
BLUE = (0,0,255)

# pygame initialization
pygame.init()

# Player class
class Player:
    def __init__(self, name, sound):
        self.name = name
        self.sound = sound
        self.score = 0

    def addPoint(self):
        effect = pygame.mixer.Sound(self.sound)
        effect.play()
        self.score = self.score + 1

    def isWinner(self):
        if self.score >= 25:
            effect = pygame.mixer.Sound('laugh.wav')
            effect.play()
            return True

    def restart(self):
        self.score = 0

player1 = Player('Player 1', 'pew.wav')
player2 = Player('Player 2', 'cowboy.wav')

# Screen creation
screen = pygame.display.set_mode((720,720))

# Start Background
start_background = pygame.image.load('intersection-rgb.png')
# Start Background
finish_background = pygame.image.load('colors.png')

pygame.mixer.music.load('NoMonkey.wav')
pygame.mixer.music.play(-1)
#music.pygame.mixer.music.play()

# Title font
title_font = pygame.font.Font('freesansbold.ttf', 130)
# Color word position
titleX = 85
titleY = 100

# Color font
color_font = pygame.font.Font('freesansbold.ttf', 128)
# Color word position
textX = 250
textY = 300

# Game over font
go_font = pygame.font.Font('freesansbold.ttf', 100)
# Color word position
textX = 250
textY = 300

# Score font
score_font = pygame.font.Font('freesansbold.ttf', 32)
# Player 1 score position
scoreX = 10
scoreY = 10

def newBattle():
    colors = ['Rojo', 'Verde', 'Azul']

    rgb_colors = [RED, GREEN, BLUE]

    background_color = random.choice(rgb_colors)
    font_color = random.choice(rgb_colors)
    while font_color == background_color:
        font_color = random.choice(rgb_colors)

    screen.fill(background_color)
    text = color_font.render(random.choice(colors), True, font_color)
    screen.blit(text, (random.randint(0,350), random.randint(30,600)))

    return font_color

game_state = 'START'
winner = ''

def showStartScreen():
    screen.blit(start_background, (0, 0))

    title = title_font.render('STROOP', True, (255,255,255))
    screen.blit(title, (titleX, titleY))

    title = score_font.render('Press ENTER to start', True, (255,255,255))
    screen.blit(title, (200, 600))

    title = score_font.render('Press I for instructions', True, (255,255,255))
    screen.blit(title, (185, 650))

def showInstructionsScreen():
    screen.fill((0,0,0))
    title = go_font.render('Instructions', True, (255,255,255))
    screen.blit(title, (50, 25))

    title = score_font.render('Just choose the font color', True, (255,255,255))
    screen.blit(title, (140, 150))

    title = go_font.render('Buttons', True, (255,255,255))
    screen.blit(title, (150, 225))

    title = score_font.render('Player 1', True, (255,255,255))
    screen.blit(title, (100, 350))
    title = score_font.render('A', True, (255,255,255))
    screen.blit(title, (145, 400))
    title = score_font.render('S', True, (255,255,255))
    screen.blit(title, (145, 440))
    title = score_font.render('D', True, (255,255,255))
    screen.blit(title, (145, 480))

    title = score_font.render('Player 2', True, (255,255,255))
    screen.blit(title, (300, 350))
    title = score_font.render('4', True, (255,255,255))
    screen.blit(title, (350, 400))
    title = score_font.render('5', True, (255,255,255))
    screen.blit(title, (350, 440))
    title = score_font.render('6', True, (255,255,255))
    screen.blit(title, (350, 480))

    title = score_font.render('Color', True, (255,255,255))
    screen.blit(title, (500, 350))
    title = score_font.render('RED', True, (255,255,255))
    screen.blit(title, (500, 400))
    title = score_font.render('GREEN', True, (255,255,255))
    screen.blit(title, (500, 440))
    title = score_font.render('BLUE', True, (255,255,255))
    screen.blit(title, (500, 480))

    title = score_font.render('First to reach 25 points wins!', True, (255,255,255))
    screen.blit(title, (140, 600))

    title = score_font.render('Press ENTER to start', True, (255,255,255))
    screen.blit(title, (200, 650))

def showFinishScreen():
    screen.blit(finish_background, (0, 0))
    title = go_font.render(winner + ' Wins!!!', True, (0,0,0))
    screen.blit(title, (10, 310))

    title = score_font.render('Press ENTER to start again', True, (0,0,0))
    screen.blit(title, (150, 600))

def showScore():
    score_text = score_font.render(player1.name + ': ' + str(player1.score), True, (255,255,255))
    screen.blit(score_text, (scoreX, scoreY))
    score_text = score_font.render(player2.name + ': ' + str(player2.score), True, (255,255,255))
    screen.blit(score_text, (scoreX + 500, scoreY))

color = BLUE
release = False

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE:
                running = False
        if event.type == pygame.QUIT:
            running = False

        if game_state == 'START':
            showStartScreen()

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_RETURN:
                    game_state = 'GAME'
                    release = True
                    pygame.mixer.music.play(-1)
                if event.key == pygame.K_i:
                    game_state = 'INSTRUCTIONS'
        elif game_state == 'GAME':
            if event.type == pygame.KEYUP and release:
                release = False
                color = newBattle()
                showScore()
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_a:
                    if color == RED:
                        player1.addPoint()
                        if player1.isWinner():
                            winner = player1.name
                            game_state = 'FINISH'
                    release = True
                if event.key == pygame.K_s:
                    if color == GREEN:
                        player1.addPoint()
                        if player1.isWinner():
                            winner = player1.name
                            game_state = 'FINISH'
                    release = True
                if event.key == pygame.K_d:
                    if color == BLUE:
                        player1.addPoint()
                        if player1.isWinner():
                            winner = player1.name
                            game_state = 'FINISH'
                    release = True
                if event.key == pygame.K_KP4:
                    if color == RED:
                        player2.addPoint()
                        if player2.isWinner():
                            winner = player2.name
                            game_state = 'FINISH'
                    release = True
                if event.key == pygame.K_KP5:
                    if color == GREEN:
                        player2.addPoint()
                        if player2.isWinner():
                            winner = player2.name
                            game_state = 'FINISH'
                    release = True
                if event.key == pygame.K_KP6:
                    if color == BLUE:
                        player2.addPoint()
                        if player2.isWinner():
                            winner = player2.name
                            game_state = 'FINISH'
                    release = True
                if event.key == pygame.K_SPACE:
                    player1.restart()
                    player2.restart()
                    game_state = 'START'
                    release = True
        elif game_state == 'FINISH':
            showFinishScreen()

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_RETURN:
                    winner = ''
                    game_state = 'GAME'
                    player1.restart()
                    player2.restart()
                    release = True
                    pygame.mixer.music.play(-1)
        elif game_state == 'INSTRUCTIONS':
            showInstructionsScreen()
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_RETURN:
                    game_state = 'GAME'
                    release = True
                    pygame.mixer.music.play(-1)

        pygame.display.update()
