
warnings.simplefilter('ignore')

from concurrent.futures import ThreadPoolExecutor
def sum_of_squares(n):
    ret = 0
    for i in range(n):
        ret += i**2
    return ret

import time
f = time.time()
with ThreadPoolExecutor() as e:
    e.submit(sum_of_squares, 1_000_000)
    e.submit(sum_of_squares, 1_000_000)
print("実行時間:", time.time()-f, "秒")

f = time.time()
sum_of_squares(1_000_000)
sum_of_squares(1_000_000)
print("実行時間:", time.time()-f, "秒")