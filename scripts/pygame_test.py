# coding: utf-8
# pygame test on jetson nano
import pygame
from pygame.locals import *
import sys

pygame.init()
screen = pygame.display.set_mode((640, 480))
pygame.display.set_caption('pygame test')

while True:
    screen.fill((255, 255, 255))
    pygame.draw.rect(screen, (0, 255, 0), Rect(10, 10, 100, 200))
    pygame.draw.circle(screen, (0, 0, 255), (320, 240), 100)

    pygame.display.update()
    for event in pygame.event.get():
        if event.type == QUIT:
            sys.exit()

