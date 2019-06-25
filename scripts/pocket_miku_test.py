# coding: utf-8
# pocket miku(midi) on jetson nano test
import pygame
import pygame.midi
from time import sleep

instrument = 0 # miku

pygame.init()
pygame.midi.init()

def main():
    # midi setup
    for i in range(pygame.midi.get_count()):
        interf, name, input_dev, output_dev, opened = pygame.midi.get_device_info(i)
        if output_dev and b'NSX-39 ' in name:
            print('NSX-39 port number is ' + str(i))
            midiOutput = pygame.midi.Output(i)

    midiOutput.set_instrument(instrument)

    # setting lyric by sending SysEx
    midiOutput.write_sys_ex(pygame.midi.time(), [0xF0, 0x43, 0X79, 0x09, 0x11, 0x0A, 0x00, 0x4A, 0x7B, 0x31, 0x25, 0x08, 0x7B, 0x10, 0x02, 0x28, 0xF7])

    midiOutput.note_on(74, 80)
    sleep(.400)
    midiOutput.note_on(74, 80)
    sleep(.100)
    midiOutput.note_on(74, 80)
    sleep(.400)
    midiOutput.note_on(74, 80)
    sleep(.100)
    midiOutput.note_on(74, 80)
    sleep(.400)
    midiOutput.note_on(74, 80)
    sleep(.100)
    midiOutput.note_on(74, 80)
    sleep(.400)
    midiOutput.note_on(74, 80)
    sleep(.100)
    midiOutput.note_on(79,80)
    sleep(.200)
    midiOutput.note_off(79,80)

    del midiOutput
    pygame.midi.quit()

if __name__ == "__main__":
    main()