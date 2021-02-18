# coding: utf-8
# raspicam on jetson nano test
import cv2

GST_STR = 'nvarguscamerasrc \
    ! video/x-raw(memory:NVMM), width=1920, height=1080, format=(string)NV12, framerate=(fraction)30/1 \
    ! nvvidconv ! video/x-raw, width=(int)640, height=(int)480, format=(string)BGRx \
    ! videoconvert \
    ! appsink drop=true sync=false'
WINDOW_NAME = 'Camera Test'

def main():
    cam = cv2.VideoCapture(GST_STR, cv2.CAP_GSTREAMER)

    while True:
        ret, img = cam.read()
        if ret != True:
            break

        cv2.imshow(WINDOW_NAME, img)

        key = cv2.waitKey(10)
        if key == 27: # ESC
            break

    cam.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
