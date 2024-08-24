'''class node():
    def __init__(self, data, nextNode):
        self.data = data
        self.nextNode = nextNode

linkedList = []

linkedList.append(node(1,1))
linkedList.append(node(5,4))
linkedList.append(node(6,7))
linkedList.append(node(7,-1))
linkedList.append(node(2,2))
linkedList.append(node(0,6))
linkedList.append(node(0,8))
linkedList.append(node(56,3))
linkedList.append(node(0,9))
linkedList.append(node(0,-1))

startPointer = 0
emptyList = 5

def outputNodes(linkedList, currentPointer):
    while(currentPointer != -1):
        print(linkedList[currentPointer].data)
        currentPointer = linkedList[currentPointer].nextNode

#outputNodes(linkedList, currentPointer)

def addNode(linkedList, currentPointer, emptyList):
    addedData = int(input("enter the data you want to insert"))

    if emptyList < 0 or emptyList > 9:
        return False
    else:
        temporaryPointer = linkedList[emptyList].nextNode
        linkedList[emptyList] = (node(addedData, -1))
        
        previousPointer = 0

        while(currentPointer != -1):
            previousPointer = currentPointer
            currentPointer = linkedList[currentPointer].nextNode
        linkedList[previousPointer].nextNode = emptyList
        emptyList = temporaryPointer

        return True


outputNodes(linkedList, startPointer)

if addNode(linkedList, startPointer, emptyList) == False:
    print("list is full")
else:
    print('successfully added')

outputNodes(linkedList, startPointer)

'''


















'''

arrayData = [10,5,6,7,1,12,13,15,21,8]

def linearSearch(ValueFind):
    for x in range(0,10):
        if ValueFind == arrayData[x]:
            return True
    
    return False

InputValue = int(input("input a number ro find: ")) 

if linearSearch(InputValue):
    print('value found')
else:
    print("value not found")

def bubbleSort(theArray):
    temp = 0
    for x in range(0,9):
        for y in range(0,10):
            if theArray[y] < theArray[y+1]:
                temp = theArray[y]
                theArray[y] = theArray[y+1]
                theArray[y+1] = temp
'''
























class TreasureChest:

    #private question stores the question asked
    # answer stores the answer to the question
    # points stores the max points awardable

    def __init__(self,question,answer,points):
        self.__question = question
        self.__answer = answer
        self.__points = points

    def getQuestion(self):
        return self.__question
    
    def checkAnswer(self, InputAnswer):
        if self.__answer == InputAnswer:
            return True
        else:
            return False
        
    def getPoints(self, Attempts):
        if Attempts == 1:
            return self.__points
        elif Attempts == 2: 
            return self.__points // 2
        elif Attempts == 3 or Attempts == 4:
            return self.__points // 4
        else:
            return 0

arrayTreasure = []

def readData():

    try:
        FileName = 'TreasureChestData.txt'
        File = open(FileName, 'r')

        for i in range(0,5):
            Question = File.readline().strip()
            Answer = File.readline().strip()
            Points = File.readline().strip()
            arrayTreasure.append(TreasureChest(Question, Answer,Points))
    except:
        print('cant access file')


readData()


QuestionNumber = 6
while(QuestionNumber not in {1, 2, 3, 4, 5}):
    QuestionNumber = int(input('enter a question number 1-5 : '))

print(arrayTreasure[QuestionNumber].getQuestion())

Attempts = 0
IsCorrect = False
while(IsCorrect == False):
    UserAnswer = int(input('Enter Answer: '))
    if  arrayTreasure[QuestionNumber].checkAnswer(UserAnswer):
        IsCorrect = True
    else:
        Attempts += Attempts

AwardedPoints = arrayTreasure[QuestionNumber].getPoints(Attempts)
print(f'points awarded: {AwardedPoints}')





