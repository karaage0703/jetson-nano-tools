# coding: utf-8
# raspicam on jetson nano test
import cv2

GST_STR = 'nvarguscamerasrc \
    ! video/x-raw(memory:NVMM), width=3280, height=2464, format=(string)NV12, framerate=(fraction)30/1 \
    ! nvvidconv ! video/x-raw, width=(int)1920, height=(int)1080, format=(string)BGRx \
    ! videoconvert \
    ! appsink'
WINDOW_NAME = 'Camera Test'

def main():
    cap = cv2.VideoCapture(GST_STR, cv2.CAP_GSTREAMER)

    while True:
        ret, img = cap.read()
        if ret != True:
            break

        cv2.imshow(WINDOW_NAME, img)

        key = cv2.waitKey(10)
        if key == 27: # ESC
            break

if __name__ == "__main__":
    main()