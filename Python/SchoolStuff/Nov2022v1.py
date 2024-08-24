'''



DataArray = [0 for i in range(100)]

def ReadFile():
global DataArray
    
    FileName = 'IntegerData.txt'
    try:
        File = open(FileName, 'r')
        for x in range(0,100):
            DataArray[x] = int(File.readline().strip())
        File.close()
    except IOError:
        print('couldnt find file')




def FindValues():
    global DataArray
    counter = 0

    FindNum = int(input("enter number to find: "))
    while(FindNum < 1 or FindNum > 100):
        FindNum = int(input("enter number to find:"))

    for x in range(0,100):
        if DataArray[x] == FindNum:
            counter = counter + 1
    return counter




def BubbleSort():
    global DataArray
    flag = True
    counter = 99
    while(flag == True and counter != -1):
        flag = False
        for x in range(0,99):
            if DataArray[x] > DataArray[x+1]:
                temp1 = DataArray[x]
                DataArray[x] = DataArray[x+1]
                DataArray[x+1] = temp1
                flag = True
        counter = counter - 1


ReadFile()

AmountNum = FindValues()
print(f'Number of times appeared: {str(AmountNum)}')


    
BubbleSort()
print(f'in order: {DataArray}')



'''




'''
class Card:
    def __init__(self, Number, Colour):

        # Number as int
        # Colour as string

        self.__Number = Number
        self.__Colour = Colour
    
    def GetNumber(self):
        return self.__Number
    
    def GetColour(self):
        return self.__Colour
    
Card1 = Card(1,'red')
Card2 = Card(2,'red')
Card3 = Card(3,'red')
Card4 = Card(4,'red')
Card5 = Card(5,'red')
Card6 = Card(1,'blue')
Card7 = Card(2,'blue')
Card8 = Card(3,'blue')
Card9 = Card(4,'blue')
Card10 = Card(5,'blue')
Card11 = Card(1,'yellow')
Card12 = Card(2,'yellow')
Card13 = Card(3,'yellow')
Card14 = Card(4,'yellow')
Card15 = Card(5,'yellow')


class Hand():
    def __init__(self, Card1, Card2, Card3, Card4, Card5):

        self.__Cards = []
        self.__Cards.append(Card1)
        self.__Cards.append(Card2)
        self.__Cards.append(Card3)
        self.__Cards.append(Card4)
        self.__Cards.append(Card5)


        self.__FirstCard = 0
        self.__NumberCards = 5

    def GetCard(self, Index):
        return self.__Cards[Index]
    
player1 =  Hand(Card1, Card2, Card3, Card4, Card11)
player2 = Hand(Card12, Card13, Card14, Card15, Card6)

def CalculateValue(PlayerHand):
    score = 0
    for x in range(0,5):
        CardSelect = PlayerHand.GetCard(x)
        if CardSelect.GetColour() == 'red':
            score = score + 5
        elif CardSelect.GetColour() == 'blue':
            score = score + 10
        else:
            score = score + 15
        score = score + CardSelect.GetNumber()
    return score

Player1Score = CalculateValue(player1)
Player2Score = CalculateValue(player2)
if Player1Score > Player2Score:
    print('player 1 wins')
elif Player1Score < Player2Score:
    print('player 2 wins')
else:
    print('draw')

'''



ArrayNodes = [[-1,-1,-1] for x in range(0,20)]

ArrayNodes[0][0] = 1
ArrayNodes[0][1] = 20
ArrayNodes[0][2] = 5
ArrayNodes[1][0] = 2
ArrayNodes[1][1] = 15

ArrayNodes[2][1] = 3
ArrayNodes[2][2] = 3
ArrayNodes[3][1] = 9
ArrayNodes[3][2] = 4
ArrayNodes[4][1] = 10
ArrayNodes[5][1] = 58

FreeNode = 6
RootPointer = 0


def SearchValue(Root, ValueToFind):
    if Root == -1:
        return -1
    else:
        if ArrayNodes[Root][1] == ValueToFind:
            return Root
        else:
            if ArrayNodes[Root][1] == -1:
                return -1
    
    if ArrayNodes[Root][1] > ValueToFind:
        return SearchValue(ArrayNodes[Root][0], ValueToFind)
            
    if ArrayNodes[Root][1] < ValueToFind:
        return SearchValue(ArrayNodes[Root][2], ValueToFind)
    

def PostOrder(Root):
    if ArrayNodes[Root][0] != -1:
        PostOrder(ArrayNodes[Root][0])
    if ArrayNodes[Root][2] != -1:
        PostOrder(ArrayNodes[Root][2])
    print(str(ArrayNodes[Root][1]))

ValueFind = 15
ValueIndex = SearchValue(RootPointer, ValueFind)

if ValueIndex != -1:
    print(f'the number is at index: {ValueIndex}')
else:
    print('Value not found in array')

PostOrder(RootPointer)
