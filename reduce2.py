from operator import itemgetter
import sys
start=0
try:
    start=sys.argv[1]
    end=sys.argv[2]
except:
    pass 

dict_ip_count = {}
for line in sys.stdin:
    line = line.strip() ##移除字符的回车 变成了[00:00]5.108.86.176	1 strip(\n)的作用就是把本来一一行一行的，全部连在一起
    ip, time, num = line.split('\t') ## 把空格去了split 的功能就是把空格去掉了ip 和number 之间的空格去掉了。变成了[00:00]5.108.86.176 1
    ## 这一步就规定了两个变量在这个结构中，ip 和 number，然后取出空格， ip 指的就是hour+ip 地址， number 就是1
    try:
        if int(start)>=int(time) and int(time)<int(end):
                num = int(num)
                dict_ip_count[ip] = dict_ip_count.get(ip, 0) + num
    except ValueError:
        pass
        
sorted_dict_ip_count = sorted(dict_ip_count.items(), key=itemgetter(1),reverse=True)[0:3]
for ip, count in sorted_dict_ip_count:
    print '%s\t%s' % (ip, count)  
