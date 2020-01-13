def showInstructions():
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

    title = score_font.render('First to reach 25 point wins!', True, (255,255,255))
    screen.blit(title, (140, 600))

    title = score_font.render('Press ENTER to start', True, (255,255,255))
    screen.blit(title, (200, 650))
