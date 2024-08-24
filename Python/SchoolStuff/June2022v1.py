
'''

ArrayScores = []

def ReadHighScores():
    FileName = 'HighScore.txt'

    try:
        File = open(FileName, 'r')
        for x in range(0,10):
            PlayerName = File.readline().strip()
            PlayerScore = File.readline().strip()
            ArrayScores.append([PlayerName, PlayerScore])
        File.close()
    except:
        print('coundnt open file')

def OutputHighScores():
    for x in range(0,10):
        print(f'{ArrayScores[x][0]}   {ArrayScores[x][1]}')

def InputNew(Name, Score):
    if Score > ArrayScores[9][1]:
        ArrayScores[9][1] = Score
        ArrayScores[9][0] = Name
        flag = True
        counter = 9
        while(flag == True and counter != 0):
            flag = False
            for x in range(0,counter):
                if ArrayScores[x][1] < ArrayScores[x+1][1]:
                    temp1 = ArrayScores[x][1]
                    temp2 = ArrayScores[x][0]
                    ArrayScores[x][0] = ArrayScores[x+1][0]
                    ArrayScores[x][1] = ArrayScores[x+1][1]
                    ArrayScores[x+1][1] = temp1
                    ArrayScores[x+1][0] = temp2
                    flag = True
            counter = counter - 1



def WriteTopTen():
    FileName = 'NewHighScore.txt'
    try:
        File = open(FileName, 'w')
        for x in range(0,10):
            File.write(str(f'{ArrayScores[x][0]} \n'))
            File.write(str(f'{ArrayScores[x][1]} \n'))
        File.close()
    except:
        print('issue with making file')






ReadHighScores()
OutputHighScores()

PlayerN = input('enter player name')
PlayerS = int(input('input score between 1 - 100000:'))
while(PlayerS < 1 or PlayerS > 100000):
    PlayerS = int(input('input score:'))

InputNew(PlayerN, PlayerS)
OutputHighScores()
'''


'''
class Balloon:
    def __init__(self, DefenceItem, Colour):
        self.__Health = 100
        self.__DefenceItem = DefenceItem
        self.__Colour = Colour

    def GetDefenceItem(self):
        return self.__DefenceItem
    
    def ChangeHealth(self, AddNumber):
        self.__Health = self.__Health + AddNumber

    def CheckHealth(self):
        if self.__Health <= 0:
            return True
        else:
            return False
        

DefenceInput = input('enter defence: ')
ColourInput = input('enter colour: ')

Balloon1 = Balloon(DefenceInput, ColourInput)

def Defend(BalloonInput):
    OpponentStrength = int(input('enter strength: '))
    BalloonInput.ChangeHealth(-OpponentStrength)
    print(f'Defence Item: {BalloonInput.GetDefenceItem()}')
    if BalloonInput.CheckHealth() == False:
        print('still alive ')
    else:
        print('dead')
    
    return BalloonInput


Balloon1 = Defend(Balloon1)

'''




QueueArray = []
for x in range(0,10):
    QueueArray.append('')

HeadPointer = 0
TailPointer = 0
NumberInQueue = 0

def Enqueue(HeadPointer, TailPointer, NumberItems, DataToAdd):
    if NumberItems == 10:
        return False, NumberItems, TailPointer
    QueueArray[TailPointer] = DataToAdd
    if TailPointer >= 9:
        TailPointer = 0
    else:
        TailPointer = TailPointer + 1
    NumberItems = NumberItems + 1
    return True, NumberItems, TailPointer



def Dequeue(HeadPointer, TailPointer, NumberItems):
    if NumberItems == 0:
        return False, HeadPointer, NumberItems
    else:
        ReturnItem = QueueArray[HeadPointer]
        if HeadPointer >= 9:
            HeadPointer = 0
        else:
            HeadPointer = HeadPointer + 1
        NumberItems = NumberItems - 1
        return ReturnItem, HeadPointer, NumberItems


for x in range(0,11):
    ToAdd = input('enter value to add: ')
    ArrayOutput, NumberInQueue, TailPointer = Enqueue(HeadPointer, TailPointer, NumberInQueue, ToAdd)
    if ArrayOutput == False:
        print('queue full: ')
    else:
        print("success")
        print(TailPointer)
        print(NumberInQueue)

output1, HeadPointer, NumberItems = Dequeue(HeadPointer, TailPointer, NumberInQueue)
output2, HeadPointer, NumberItems = Dequeue(HeadPointer, TailPointer, NumberInQueue)

print(str(output1))
print(str(output2))

