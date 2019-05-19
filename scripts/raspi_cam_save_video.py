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
    cam = cv2.VideoCapture(GST_STR, cv2.CAP_GSTREAMER)

    fps = cam.get(cv2.CAP_PROP_FPS)
    height = cam.get(cv2.CAP_PROP_FRAME_HEIGHT)
    width  = cam.get(cv2.CAP_PROP_FRAME_WIDTH)

    fourcc = cv2.VideoWriter_fourcc('m','p','4','v')

    out = cv2.VideoWriter('output.avi', int(fourcc), fps, (int(width), int(height)))

    while True:
        ret, img = cam.read()
        if ret != True:
            break

        cv2.imshow(WINDOW_NAME, img)
        out.write(img)

        key = cv2.waitKey(10)
        if key == 27: # ESC
            break

    out.release()
    cam.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()