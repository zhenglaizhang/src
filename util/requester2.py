import urllib.request
import re
import time


def get():
    with urllib.request.urlopen('http://live.9666.cn/166/') as response:
        text = response.read().decode('utf-8')
        pat = '"msgs"(.*)'
        match = re.search(pat, text, re.M | re.I)
        if match:
            s = match.group()
            s = s[15:-2]
            line = re.split('[a-z|"|\s|\\|<|>|\\\\|/|\{|\}|:]', s)
            ret = []
            i = 0
            while i < len(line):
                if line[i] in ['', ',', '"', "'", '-', '=', '送', '金色红牛', '.', 'EDITOR_LIVE', '.9666.']:
                    i = 1 + i
                    continue
                elif line[i].find('礼物') > 0:
                    i = 1 + i
                    continue
                elif len(line[i]) < 6 or line[i].startswith('221') or line[i].startswith('129') or line[i].startswith('128') or line[i].startswith('=') or line[i].count('-') > 2:
                    i = 1 + i
                    continue
                else:
                    ret.append(line[i])
                    i = 1 + i
            return ret

last = []
now = []
while True:
    print(time.strftime("%Y-%m-%d %H:%M:%S"), "Refreshing ...")
    now = get()
    i = len(last)
    for i in range(len(last), len(now)):
        print(now[i])
    last = now
    time.sleep(30)
                    
        
        
