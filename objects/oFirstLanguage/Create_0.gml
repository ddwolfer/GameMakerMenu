/// @description Insert description here
// You can write your code in this editor

var Lwidth = 1920 //=640*2
var Lheight = 1080 //=360*2

//目前畫面
enum FirstScreen{
	main = 0,
	quitGame = 1
}
FirstScreen = FirstScreen.main
Title = "Language"
languageOptions = ["English","Traditional Chinese","Simple Chinese","Japanese","TEST"]
languageOptionsAble = [1,1,0,0,0]

ChoicePointer = 0
quitPointer = 1
//文字設定
LanguageFont[0] = "EquipmentPro.ttf"
LanguageFont[1] = "Chinese.ttf"
MenuFontSize = 11 * global.windowsSize
optionFontSize = 15 * global.windowsSize
MenuFont = font_add(LanguageFont[global.gameLanguage], MenuFontSize, false, false, 0, 65535)
ChooseCuesor = font_add("EquipmentPro.ttf", 17 * global.windowsSize, false, false, 0, 65535)
optionFont = font_add(LanguageFont[global.gameLanguage], optionFontSize, false, false, 0, 65535)

#region // 選擇語言的主畫面
MainDivX1 = Lwidth * 0.15 
MainDivX2 = MainDivX1 + Lwidth * 0.7
MainDivY1 = Lheight * 0.2
MainDivY2 = MainDivY1 + Lheight * 0.6
//MainDivCenterXY = [ (MainDivX1+MainDivX2)/2 , (MainDivY1+MainDivY2)/2] //中心點
#endregion

#region// 標題框框
MainTitleX1 = Lwidth * 0.375
MainTitleX2 = MainTitleX1 + Lwidth * 0.25
MainTitleY1 = Lheight * 0.16
MainTitleY2 = MainTitleY1 + Lheight * 0.08
MainTitleCenterXY = [ (MainTitleX1+MainTitleX2)/2 , (MainTitleY1+MainTitleY2)/2] //中心點
#endregion

#region//內框
ContentDivYMin = MainTitleY2
ContentDivYMax = MainDivY2 - (MainTitleY2-MainDivY1)
ContentDivXMin = MainDivX1 + (MainTitleY2-MainDivY1)
ContentDivXMax = MainDivX2 - (MainTitleY2-MainDivY1)
#endregion

#region//選擇語言的地方
LanguageBoxHeight = Lheight * 0.1
LanguageBoxWidth = Lwidth * 0.25 
LanguageRowNum = round( array_length_1d(languageOptions)/2.0 + 0.1 ) //會有幾排
LanguageBoxYSpace = ( ( ContentDivYMax - ContentDivYMin ) - LanguageRowNum * LanguageBoxHeight ) / (LanguageRowNum+1) //算Y軸間距
LanguageBoxXSpace = (ContentDivXMax - ContentDivXMin - LanguageBoxWidth*2)/3
LanguageBoxX1 = [ContentDivXMin + LanguageBoxXSpace, ContentDivXMin + LanguageBoxXSpace*2 + LanguageBoxWidth]
LanguageBoxX2 = [ContentDivXMin + LanguageBoxXSpace + LanguageBoxWidth, ContentDivXMin + LanguageBoxXSpace*2 + LanguageBoxWidth*2]
#endregion

#region //退出按鈕

quitButtonSize = (MainDivY2 - ContentDivYMax)*0.8
quitButtonX1 = MainDivX2 - quitButtonSize
quitButtonX2 = MainDivX2 + quitButtonSize
quitButtonY1 = MainDivY2 - quitButtonSize
quitButtonY2 = MainDivY2 + quitButtonSize

quitButtonLineSize = quitButtonSize*0.7
quitButtonLineX1 = MainDivX2 - quitButtonLineSize
quitButtonLineX2 = MainDivX2 + quitButtonLineSize
quitButtonLineY1 = MainDivY2 - quitButtonLineSize
quitButtonLineY2 = MainDivY2 + quitButtonLineSize

#endregion

#region //退出畫面

quitAlarm = "Sure to quit the game?"
quitAlarm_X = 320 * global.windowsSize
quitAlarm_Y = ((360/2) - 40) * global.windowsSize

YesOrNo =["No", "Yes"]

quitBackgroundX1 = 200 * global.windowsSize
quitBackgroundX2 = 440 * global.windowsSize
quitBackgroundY1 = 100 * global.windowsSize
quitBackgroundY2 = 220 * global.windowsSize

YesText_X = ((640/2) - 40)  * global.windowsSize
NoText_X =  ((640/2) + 40) * global.windowsSize
CheckText_Y = (360/2 + 10) * global.windowsSize

YesBoxX1 =250 * global.windowsSize
YesBoxX2 =310 * global.windowsSize
YesBoxY1 =175 * global.windowsSize
YesBoxY2 =200 * global.windowsSize

NoBoxX1 =330 * global.windowsSize
NoBoxX2 =390 * global.windowsSize
NoBoxY1 =175 * global.windowsSize
NoBoxY2 =200 * global.windowsSize
#endregion