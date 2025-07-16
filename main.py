import pyautogui
import random
import time
import numpy as np
import cv2
import os
import glob
from pynput.keyboard import Key, Controller
pyautogui.FAILSAFE = False

def capture():
    os.system("C:\\Users\\hsuck\\AppData\\Local\\Android\\Sdk\\platform-tools\\adb shell screencap -p /sdcard/screen.png")
    os.system("C:\\Users\\hsuck\\AppData\\Local\\Android\\Sdk\\platform-tools\\adb pull /sdcard/screen.png")
    return cv2.imread("screen.png")

    # screenshot = pyautogui.screenshot()
    # screenshot = np.array(screenshot)
    # screenshot = cv2.cvtColor(screenshot, cv2.COLOR_RGB2BGR)


# 스크린샷을 찍고 템플릿 매칭을 통해 화면을 분석하는 함수
def find_target_image_on_screen(screenshot, target_image_path):
    # 목표 이미지 로딩
    target_image = cv2.imread(target_image_path, cv2.IMREAD_COLOR_BGR)

    # 화면에서 템플릿 매칭
    result = cv2.matchTemplate(screenshot, target_image, cv2.TM_CCOEFF_NORMED)
    threshold = 0.8  # 매칭의 정확도, 0.8 이상일 경우 성공으로 간주

    locations = np.where(result >= threshold)

    if locations[0].size > 0:
        return int(locations[1][0]), int(locations[0][0]) # locations
    else:
        return None

# 마우스 클릭을 수행하는 함수
def click_on_location(location):
    if location:
        x, y = location
        x += random.randint(1, 2)
        y += random.randint(1, 2)

        # pyautogui.click(x, y)
        os.system(f"C:\\Users\\hsuck\\AppData\\Local\\Android\\Sdk\\platform-tools\\adb shell input tap {x} {y}")

        print(f'클릭 위치: ({x}, {y})')
    else:
        print("클릭할 위치가 없습니다.")

def find_scenario(name, retry_for, wait_time=0):
    files = glob.glob(os.path.join(name, "*.png"))

    i = 0
    while i < len(files):

        # 화면 캡처
        screenshot = capture()

        while i < len(files):
            filename = files[i]
            print(filename)
            found_location = find_target_image_on_screen(screenshot, filename)
            if found_location is None:
                i += 1
            else:
                break

        if found_location and "04.png" in filename:
            print(f"{filename}: 대상 화면 발견!")
            click_on_location(found_location)
            time.sleep(random.randint(0, 1))  # 클릭 후 잠시 대기 (필요시 수정 가능)
            click_on_location((1000, 1150))
            time.sleep(random.randint(1, 2))  # 클릭 후 잠시 대기 (필요시 수정 가능)

        elif found_location and "10.png" in filename:
            print("같은 출정 목표")
            click_on_location(found_location)
            time.sleep(1)
            click_on_location((70, 145))
            time.sleep(random.randint(1, 2))  # 클릭 후 잠시 대기 (필요시 수정 가능)

        elif found_location:
            print(f"{filename}: 대상 화면 발견!")
            click_on_location(found_location)
            time.sleep(random.randint(1, 2))  # 클릭 후 잠시 대기 (필요시 수정 가능)

        else:
            print(f"{filename}: 대상 화면 미발견.")
            if filename in retry_for:
                print("현재 이미지 검색 재수행")
                i -= 2

        i += 1
    
    time.sleep(wait_time)

# 프로그램 실행
try:
    while True:
        find_scenario("start_rally", retry_for=[os.path.join("start_rally", "3.png")])#, wait_time=random.randint(6*60, 6.5*60))
        time.sleep(0.5)  # 화면 체크 주기 (0.5초)

except KeyboardInterrupt:
    print("프로그램 종료.")
