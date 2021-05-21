import socket 
from threading import Thread 
from SocketServer import ThreadingMixIn 
import requests, json, random
import subprocess

def recv_n(conn, n):
    res = ''
    total = 0
    while True:
        R = conn.recv(1)
        total += len(R)
        res += R
        if total == n:
            return res

def recv_until(conn, patt):
    res = ''
    total = 0
    while True:
        R = conn.recv(1)
        res += R
        if res.endswith(patt):
            return res

def login(user_id, user_tk):
    url = 'http://pwnable.kr/fuzzcoin/checkuser.php?user_id={0}&user_tk={1}'.format(user_id, user_tk)
    res = requests.get( url )
    data = res.json()
    if int(data) == 1:
        return True
    return False

def reward(user_id, user_tk):
    url = 'http://pwnable.kr/fuzzcoin/rewarduser.php?user_id={0}&user_tk={1}'.format(user_id, user_tk)
    res = requests.get( url )
    data = res.json()
    if int(data) == 1:
        return True
    return False

def random_bit_patt(N):
    return ''.join([random.choice('01') for n in xrange(N)])


def execute(cmd) :
    fd = subprocess.Popen(cmd, shell=True,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    return fd.stdin, fd.stdout, fd.stderr

def hexify(s):
    return s.replace('0x','').replace('L','')

def play(s):
    BASE = random.randrange(0, 0xFFFFFFFFFFFFFFFF)
    RANGE = 0x2000
    ANSWER = random.randrange(BASE, BASE+RANGE)

    print 'BASE : ', hex(BASE)
    print 'RANGE : ', hex(RANGE)
    print 'ANSWER : ', hex(ANSWER)

    try:
        i, o, e = execute("./test {0}".format(ANSWER))
    except:
        # lot of thing here.
        print 'exception while running fuzzer'
        pass

    pattern = int(e.read().split('execution hash : [')[1].split(']')[0], 16)
    pattern = bin(pattern).replace('0b','')
    print 'challange pattern: ', pattern
    packet = '{'
    packet += '"pattern":"{0}",'.format(pattern)
    packet += '"start":"{0}",'.format(hexify(hex(BASE)))
    packet += '"end":"{0}"'.format(hexify(hex(BASE+RANGE)))
    packet += '}'

    print 'sending challenge'
    s.sendall(packet + '##')

    print 'waiting for answer...'
    try:
        ans = recv_until(s, '##')[:-2]
    except:
        print '[-] slave exit'
        return False

    print 'got answer... checking...'
    data = json.loads(ans)
    print 'I got ({0})'.format(data)
    if data['coin'] == hexify(hex(ANSWER)):
        print 'report authenticated'
        s.send('REPORT_SUCCESS\n')
        return True
    
    s.send('REPORT_ERROR\n')
    return False


def HandleThread(conn, ip, port):
    print '[+] new connection from {0}:{1}'.format(ip, port)

    # login loop
    while True:
        # check magic
        print 'waiting packet...'
        packet = recv_until(conn, '##')[:-2]
        cred = json.loads(packet)
        if cred['magic'] != 'FUZZ':
            print '[-] login failed (magic error)'
            conn.send('ERROR\n')
            continue
        
        user_id = cred['user_id']
        user_tk = cred['user_tk']
        print user_id
        print user_tk
        if not login(user_id, user_tk):
            print '[-] login failed'
            conn.send('ERROR\n')
            continue
    
        conn.send('LOGIN_SUCCESS\n')

        print '[+] login ok'

        try:
            while True:
                if play(conn):
                    # implement point update here.
                    if reward(user_id, user_tk):
                        print '[+] slave report authenticated'
                    else:
                        print '[-] main server rejected reward'
                else:
                    raise 'END'
        except:        
            print '[-] slave exit'
            break


import sys
def StartServer():
    if len(sys.argv)!=2:
        print 'usage: python server.py [port]'
        return

    TCP_IP = '0.0.0.0' 
    TCP_PORT = int(sys.argv[1])
    BUFFER_SIZE = 20

    tcpServer = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
    tcpServer.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) 
    tcpServer.bind((TCP_IP, TCP_PORT)) 
    threads = [] 

    while True: 
        tcpServer.listen(32) 
        print "waiting connection..." 
        try:
            (conn, (ip,port)) = tcpServer.accept()
        except:
            print 'terminate...'
            break

        newthread = Thread(target=HandleThread, args=(conn, ip, port))
        newthread.start()
        threads.append(newthread) 
     
    for t in threads: 
        t.join()

if __name__ == "__main__":
    StartServer()



