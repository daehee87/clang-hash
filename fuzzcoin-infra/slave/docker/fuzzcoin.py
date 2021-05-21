#!/usr/bin/python2 -u 
import subprocess, json
from socket import *
import sys, os, struct, time, random, requests
import urllib, urllib2, string, hashlib, telnetlib

def http_request(url):
    url = urllib2.quote(url)				# %3f%2e... style encoding
    post = [('key1', 'param1'), ('key2', 'param2')]
    post = urllib.urlencode(post)				# post parameter encoding
    req = urllib2.Request(url, post)			# if we give 2nd arg, it uses POST
    #req = urllib2.Request(url)				# this is GET
    # req.add_header("Cookie", "COOKIENAME=VALUE")		# add cookies as many you want
    return urllib2.urlopen(req).read()

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

def hexify(s):
    return s.replace('0x','').replace('L','')

def execute(cmd) :
    fd = subprocess.Popen(cmd, shell=True,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
    return fd.stdin, fd.stdout, fd.stderr

def mutate(seed):
    # generate or mutate the fuzzer input (argv[1]) based on seed
    return True

# master implements this
def login(s, user_id, user_tk):
    packet = '{'
    packet += '"magic": "FUZZ",'
    packet += '"user_id": "{0}",'.format(user_id)
    packet += '"user_tk": "{0}"}}'.format(user_tk)
    s.sendall(packet + '##')
    res = recv_until(s, '\n')[:-1]
    if res=='LOGIN_SUCCESS':
        return True
    return False

# master implements this
def report(s, coin):
    packet = '{'
    packet += '"coin":"{0}"}}'.format(coin)
    print 'SEND report...'
    print packet
    s.sendall(packet + '##')
    res = recv_until(s, '\n')[:-1]
    if res=='REPORT_SUCCESS':
        return True
    return False

if __name__ == '__main__':
    # implement login.
    s = socket(AF_INET, SOCK_STREAM)
    s.connect( ('172.16.92.144', 5557) )

    while True:
        user = raw_input('User ID: ')
        token = raw_input('Token : ')
        if login(s, user, token) == True:
            break
        print 'login failed...'
    print 'login OK!'

    while True:
        print 'waiting challenge...'
        # get challenge
        packet = recv_until(s, '##')[:-2]
        print packet
        chal = json.loads(packet)

        pattern = chal['pattern']       # bin string format
        start = int(chal['start'],16)   # start seed (unsigned 64bit hex string)
        end = int(chal['end'],16)       # end seed (unsigned 64bit hex string)
        coin = 0

        print 'pattern: ', pattern
        print 'start: ', pattern
        print 'end: ', pattern

        # search all the given input space range...
        i = start
        while i <= end:
            # implement input mutation here. (todo.)

            try:
                I, O, E = execute("/test {0}".format(i))
            except:
                # lot of thing here.
                pass

            # get coverage, hash, crash information from the execution result
            current_hash = E.read().split('execution hash : [')[1].split(']')[0]
            current_hash = bin(int(current_hash,16)).replace('0b','')
            if i%1000 == 0:
                print 'current: {0}, target: {1}'.format(current_hash, pattern)

            # compare hash
            if current_hash.find(pattern)!=-1:
                # hash found!
                print 'coin found!'
                coin = i

            i+=1
                
        if report(s, hexify(hex(coin))):
            print 'got auth from server!'
        else:
            break
     
    print 'Your coin got rejected from server'



