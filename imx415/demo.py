import cv2

cap = cv2.VideoCapture("/dev/video22")
cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter_fourcc('U', 'Y', 'V', 'Y'))
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)

fourcc = cv2.VideoWriter_fourcc(*'XVID') 
out = cv2.VideoWriter("output.avi", fourcc, 30.0, (1280, 720))

try:
    while True:
        ret, frame = cap.read()
        if not ret:
            break

        out.write(frame)

except:
    print("stopped")
finally:
    cap.release()
    out.release()