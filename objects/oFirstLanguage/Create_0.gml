/// @description Insert description here
// You can write your code in this editor

var Lwidth = 640 //=640
var Lheight = 360 //=360

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

DrawMainDivX1 = MainDivX1 * global.windowsSize
DrawMainDivX2 = MainDivX2 * global.windowsSize
DrawMainDivY1 = MainDivY1 * global.windowsSize
DrawMainDivY2 = MainDivY2 * global.windowsSize
//MainDivCenterXY = [ (MainDivX1+MainDivX2)/2 , (MainDivY1+MainDivY2)/2] //中心點
#endregion

#region// 標題框框
MainTitleX1 = Lwidth * 0.375
MainTitleX2 = MainTitleX1 + Lwidth * 0.25
MainTitleY1 = Lheight * 0.16
MainTitleY2 = MainTitleY1 + Lheight * 0.08
MainTitleCenterXY = [ (MainTitleX1+MainTitleX2)/2 , (MainTitleY1+MainTitleY2)/2] //中心點

DrawMainTitleX1 = MainTitleX1 * global.windowsSize
DrawMainTitleX2 = MainTitleX2 * global.windowsSize
DrawMainTitleY1 = MainTitleY1 * global.windowsSize
DrawMainTitleY2 = MainTitleY2 * global.windowsSize
DrawMainTitleCenterXY = MainTitleCenterXY
DrawMainTitleCenterXY[0] = DrawMainTitleCenterXY[0] * global.windowsSize
DrawMainTitleCenterXY[1] = DrawMainTitleCenterXY[1] * global.windowsSize
#endregion

#region//內框
ContentDivYMin = MainTitleY2
ContentDivYMax = MainDivY2 - (MainTitleY2-MainDivY1)
ContentDivXMin = MainDivX1 + (MainTitleY2-MainDivY1)
ContentDivXMax = MainDivX2 - (MainTitleY2-MainDivY1)

DrawContentDivYMin = ContentDivYMin * global.windowsSize
DrawContentDivYMax = ContentDivYMax * global.windowsSize
DrawContentDivXMin = ContentDivXMin * global.windowsSize
DrawContentDivXMax = ContentDivXMax * global.windowsSize
#endregion

#region//選擇語言的地方
LanguageBoxHeight = Lheight * 0.1
LanguageBoxWidth = Lwidth * 0.25 
LanguageRowNum = round( array_length_1d(languageOptions)/2.0 + 0.1 ) //會有幾排
LanguageBoxYSpace = ( ( ContentDivYMax - ContentDivYMin ) - LanguageRowNum * LanguageBoxHeight ) / (LanguageRowNum+1) //算Y軸間距
LanguageBoxXSpace = (ContentDivXMax - ContentDivXMin - LanguageBoxWidth*2)/3
LanguageBoxX1 = [ContentDivXMin + LanguageBoxXSpace, ContentDivXMin + LanguageBoxXSpace*2 + LanguageBoxWidth]
LanguageBoxX2 = [ContentDivXMin + LanguageBoxXSpace + LanguageBoxWidth, ContentDivXMin + LanguageBoxXSpace*2 + LanguageBoxWidth*2]

DrawLanguageBoxHeight = LanguageBoxHeight * global.windowsSize
DrawLanguageBoxWidth = LanguageBoxWidth * global.windowsSize
DrawLanguageBoxYSpace = LanguageBoxYSpace * global.windowsSize
DrawLanguageBoxXSpace = LanguageBoxXSpace * global.windowsSize
DrawLanguageBoxX1 = [LanguageBoxX1[0] * global.windowsSize, LanguageBoxX1[1] * global.windowsSize]
DrawLanguageBoxX2 = [LanguageBoxX2[0] * global.windowsSize, LanguageBoxX2[1] * global.windowsSize]
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

DrawQuitButtonSize = quitButtonSize * global.windowsSize
DrawQuitButtonX1 = quitButtonX1 * global.windowsSize
DrawQuitButtonX2 = quitButtonX2 * global.windowsSize
DrawQuitButtonY1 = quitButtonY1 * global.windowsSize
DrawQuitButtonY2 = quitButtonY2 * global.windowsSize

DrawQuitButtonLineSize = quitButtonLineSize * global.windowsSize
DrawQuitButtonLineX1 = quitButtonLineX1 * global.windowsSize
DrawQuitButtonLineX2 = quitButtonLineX2 * global.windowsSize
DrawQuitButtonLineY1 = quitButtonLineY1 * global.windowsSize
DrawQuitButtonLineY2 = quitButtonLineY2 * global.windowsSize

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

YesBoxX1 = 250
YesBoxX2 = 310
YesBoxY1 = 175
YesBoxY2 = 200

NoBoxX1 = 330
NoBoxX2 = 390
NoBoxY1 = 175
NoBoxY2 = 200

DrawYesBoxX1 =YesBoxX1 * global.windowsSize
DrawYesBoxX2 =YesBoxX2 * global.windowsSize
DrawYesBoxY1 =YesBoxY1 * global.windowsSize
DrawYesBoxY2 =YesBoxY2 * global.windowsSize

DrawNoBoxX1 =NoBoxX1 * global.windowsSize
DrawNoBoxX2 =NoBoxX2 * global.windowsSize
DrawNoBoxY1 =NoBoxY1 * global.windowsSize
DrawNoBoxY2 =NoBoxY2 * global.windowsSize

#endregion