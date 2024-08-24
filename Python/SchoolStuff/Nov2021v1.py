"""

def Unknown(InputX, InputY):
    if InputX < InputY:
        print(InputY + InputX)
        return Unknown(InputX + 1, InputY) * 2
    elif InputX == InputY:
        return 1
    else:
        print(InputY + InputX)
        return Unknown(InputX -1, InputY) // 2
    

        


    

print("parameter1: 10, parameter2: 15")
Value1 = Unknown(10, 15)
print(str(Value1))


print("parameter1: 10, parameter2: 10")
Value2 = Unknown(10, 10)
print(str(Value2))


print("parameter1: 15, parameter2: 10")
Value3 = Unknown(15, 10)
print(str(Value3))


def IterativeUnknown(InputX, InputY):
    counter = 0
    if InputX < InputY:
        while(InputX != InputY):
            print(InputY + InputX)
            InputX = InputX + 1
            counter = counter + 1
            if InputX == InputY:
                return 2**counter
    
    elif InputX == InputY:
        return 1
    
    else:
        while(InputX != (InputY)):
            print(InputY + InputX)
            InputX = InputX - 1
            if InputX == InputY:
                return 0


print("parameter1: 10, parameter2: 15")
IterativeValue1 = IterativeUnknown(10, 15)
print(str(IterativeValue1))


print("parameter1: 10, parameter2: 10")
IterativeValue2 = IterativeUnknown(10, 10)
print(str(IterativeValue2))


print("parameter1: 15, parameter2: 10")
IterativeValue3 = IterativeUnknown(15, 10)
print(str(IterativeValue3))       
"""




"""
class Picture:
    def __init__(self,Description,Width,Height,FrameColour):
        self.__Derscription = Description
        self.__Width = Width
        self.__Height = Height
        self.__FrameColour = FrameColour

    def GetDescription(self):
        return self.__Description

    def GetHeight(self):
        return self.__Height

    def GetWidth(self):
        return self.__Width

    def GetColour(self):
        return self.__Colour

    def SetDescription(self,ChangedDescription):
        self.__Description = ChangedDescription


array = []

def ReadData():
    try:
        global array
        FileName = 'Pictures.txt'
        File = open(FileName, 'r')
        for x in range(0,100):
            Desc = File.readline().strip()
            Width = File.readline().strip()
            Height = File.readline().strip()
            Frame = File.readline().strip()
            array.append(Picture(Desc,Width,Height,Frame))
        File.close()
    except:
        print('error with file, could not be found')


ReadData()

UserAskFrame = input("frame colour: ")
UserAskWidth = input("frame Width: ")
UserAskHeight = input("frame Height: ")
counter = 0
while(counter != 100):
    colour = array[counter].GetColour()
    if colour.upper() == UserAskFrame.upper():
        if array[counter].GetWidth() <= UserAskWidth:
            if array[counter].GetHeight() <= UserAskHeight:
                print(f'Desc: {array[counter].GetDescription()} Width: {array[counter].GetWidth()} Height: {array[counter].GetHeight()}')

    counter += counter

"""








ArrayNodes = []
RootPointer = -1
FreeNode = 0
'''
def AddNode(Array,RootP,FreeN):
    DataInput = int(input('enter the data'))
    NodeInput = [
        [-1, DataInput, -1]
    ]
    if RootP == -1 and FreeN != 20:
        Array.append(NodeInput)
    elif FreeNode != 20:
        NodePut = False
        NodePointer = 0
        while(NodePut == False):
            if Array[NodePointer][1] > NodeInput:
                if Array[NodePointer][2] == -1:
                    Array[NodePointer][2] = FreeNode
                    Array.append(NodeInput)
                    NodePut = True
                    break
                NodePointer = Array[NodePointer][2]

            else:
                if Array[NodePointer][1] == -1:
                    Array[NodePointer][1] = FreeNode
                    Array.append(NodeInput)
                    NodePut = True
                    break
                NodePointer = Array[NodePointer][1]
    else:
        print('array is full')
'''

def AddNode(ArrayNodes, RootPointer, FreeNode):
    NodeData = int(input('enter data: '))

    if FreeNode <= 19:
        NodeMake = [-1, NodeData, -1]
        ArrayNodes.append(NodeMake)

        if RootPointer == -1:
            RootPointer = 0
        else:
            Placed = False
            CurrentNode = RootPointer
            while(Placed == False):
                if NodeData < ArrayNodes[CurrentNode][1]:
                    if ArrayNodes[CurrentNode][0] == -1:
                        ArrayNodes[CurrentNode][0] = FreeNode
                        Placed = True
                    else:
                        CurrentNode = ArrayNodes[CurrentNode][0]
                else:
                    if ArrayNodes[CurrentNode][2] == -1:
                        ArrayNodes[CurrentNode][2] = FreeNode
                        Placed = True
                    else:
                        CurrentNode = ArrayNodes[CurrentNode][2]
        FreeNode = FreeNode + 1
    else:
        print('tree is full')

    return RootPointer, FreeNode


def PrintAll(ArrayNodes,FreeNode):
    for x in range(0,FreeNode):
        print(f'{ArrayNodes[x][0]:>5}   {ArrayNodes[x][1]:>5}   {ArrayNodes[x][2]:>5}')



for y in range(0,10):
    RootPointer, FreeNode = AddNode(ArrayNodes,RootPointer, FreeNode)

PrintAll(ArrayNodes,FreeNode)


def InOrder(ArrayNodes, RootPointer):
    if ArrayNodes[RootPointer][0] != -1:
        InOrder(ArrayNodes, ArrayNodes[RootPointer][0])
    print(str(ArrayNodes[RootPointer][0]))
    if ArrayNodes[RootPointer][2] != -1:
        InOrder(ArrayNodes, ArrayNodes[RootPointer][2])





