stage = 6

def calculate (num):
    vtarget = num

    # 0 - low, 1 - high
    # 10 - off, 00 - down, 11 - up
    config = []
	
    while vtarget != pow(2, stage):
        vtarget *= 2
        if (vtarget < pow(2, stage)):
            # down stage
            config.append((0,0))
        elif(vtarget > pow(2, stage)):
            # up stage
            vtarget -= pow(2, stage)
            config.append((1,1))
     	
    # off stages
    for i in range(0, stage-len(config)):
        config.append((1,0))

    return num, config

def verifyConfig(vtarget, config):
    vtemp = 0
    selh = ""
    sell = ""
    for cfg in reversed(config):
        if cfg == (1,0):
            selh += "1"
            sell += "0"
            vtemp = pow(2, stage-1)
        elif cfg == (0,0):
            selh += "0"
            sell += "0"
            vtemp /= 2
        elif cfg == (1,1):
            selh += "1"
            sell += "1"
            vtemp = (vtemp + pow(2, stage)) / 2
        else:
            print("ERROR")
            return
    if vtemp != vtarget:
        print("ERROR")
        return
    return selh + sell

def printConfig(num):
    if num == 0:
        print("000000 000000100000")
        return
    vtarget, config = calculate(num)
    output = verifyConfig(vtarget, config)
    print(str(bin(num))[2:].zfill(6) + " " + output)
	
if __name__ == "__main__":
    # print(".i 6\n.o 12\n.ilb a[5] a[4] a[3] a[2] a[1] a[0]\n.ob ",end='')
    # for i in range(11,-1,-1):
    #     print("s[",i, "]", sep='', end=' ')
    # print("")
	
    for i in range(0,64):
        printConfig(i)
	
    # print(".e")