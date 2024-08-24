class Character:
    def __init__(self, Name, Xcoordinate, Ycoordinate):
        self.__Name = Name
        self.__Xcoordinate = Xcoordinate
        self.__Ycoordinate = Ycoordinate
    
    def GetName(self):
        return self.__Name

    def GetX(self):
        return self.__Xcoordinate

    def GetY(self):
        return self.__Ycoordinate

    def ChangePosition(self, ChangeX, ChangeY):
        self.__Xcoordinate += ChangeX
        self.__Ycoordinate += ChangeY

# Initialize the Characters list
Characters = []
FileName = "Characters.txt"

# Reading the file and creating Character instances
try:
    File = open(FileName, 'r')
    for _ in range(10):  # Adjust the range if needed
        Name = File.readline().strip()
        Xcoordinate = File.readline().strip()
        Ycoordinate = File.readline().strip()
        if Name and Xcoordinate and Ycoordinate:  # Ensure no empty lines
            TempCharacter = Character(Name, int(Xcoordinate), int(Ycoordinate))
            Characters.append(TempCharacter)
    File.close()
except FileNotFoundError:
    print("File not found")

# Testing the character creation
for character in Characters:
    print(character.GetName(), "=", character.GetX(), character.GetY())

# Searching for a character by name
Position = -1

while Position == -1:
    CharacterName = input("Enter character name: ")
    for z in range(0,10):
        if CharacterName.lower() == Characters[z].GetName().lower():
            Position = z
            break  # Exit the loop once the character is found


print(str(Position), str(Characters[Position].GetX()))

MovementValid = False

while(MovementValid == False):
    MovementLetter = input('enter move letter A, W, S or D (in capital)')
    if MovementLetter == 'A':
        Characters[Position].ChangePosition(-1,0)
        MovementValid = True
    elif MovementLetter == 'W':
        Characters[Position].ChangePosition(0,1)
        MovementValid = True
    elif MovementLetter == 'S':
        Characters[Position].ChangePosition(0,-1)
        MovementValid = True
    elif MovementLetter == 'D':
        Characters[Position].ChangePosition(1,0)
        MovementValid = True

print(f"{Characters[Position].GetName()} has changed coordinates to X = {Characters[Position].GetX()} and Y = {Characters[Position].GetY()}")