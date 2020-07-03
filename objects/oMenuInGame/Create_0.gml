/// @description Insert description here
// You can write your code in this editor

enum IGMenuScreen{
	off = 0,
	main = 1,
	option = 2
}
IGMenuScreen = IGMenuScreen.off

InGameMenuCursor = 0

#region 文字內容
//語言
LanguageOption[0] = "English"
LanguageOption[1] = "繁體中文"

LanguageFont[0] = "EquipmentPro.ttf"
LanguageFont[1] = "Chinese.ttf"

//選像頁面文字
optionMenuText[0, 0] = "Resolution"
optionMenuText[0, 1] = "Full Screen"
optionMenuText[0, 2] = "Language"
optionMenuText[0, 3] = "Music"
optionMenuText[0, 4] = "SFX"

optionMenuText[1, 0] = "解析度"
optionMenuText[1, 1] = "全螢幕"
optionMenuText[1, 2] = "語言"
optionMenuText[1, 3] = "音樂"
optionMenuText[1, 4] = "音效"

LoadTxT [0,0] = "SAVE"
LoadTxT [1,0] = "存檔"

EmptyTxT [0,0] = "Empty"
EmptyTxT [1,0] = "空"

//解析度大小 (640*360 的幾倍)
resolution[0] = "640*360" 
resolution[1] = "1280*720" 
resolution[2] = "1440*810" 
resolution[3] = "1920*1080" 

IGMainMenuText [0, 0] = "RESUME"
IGMainMenuText [0, 1] = "OPTION"
IGMainMenuText [0, 2] = "SAVE & QUIT"

IGMainMenuText [1, 0] = "返回遊戲"
IGMainMenuText [1, 1] = "選項"
IGMainMenuText [1, 2] = "儲存並離開"

//文字設定
MenuFontSize = 11 * global.windowsSize
optionFontSize = 15 * global.windowsSize
MenuFont = font_add(LanguageFont[global.gameLanguage], MenuFontSize, false, false, 0, 65535)
ChooseCuesor = font_add("EquipmentPro.ttf", 17 * global.windowsSize, false, false, 0, 65535)
optionFont = font_add(LanguageFont[global.gameLanguage], optionFontSize, false, false, 0, 65535)
#endregion


// main 設定
IGmainTextStart_X = 200
IGmainTextSEnd_X = 640 - IGmainTextStart_X
IGmainTextStart_Y = 142.5
IGmainText_H = 25

DrawIGmainTextStart_X = IGmainTextStart_X * global.windowsSize
DrawIGmainTextSEnd_X = IGmainTextSEnd_X * global.windowsSize
DrawIGmainTextStart_Y = IGmainTextStart_Y * global.windowsSize
DrawIGmainText_H = IGmainText_H * global.windowsSize

#region option page 設定
//選像頁面文字
optionMenuText[0, 0] = "Resolution"
optionMenuText[0, 1] = "Full Screen"
optionMenuText[0, 2] = "Language"
optionMenuText[0, 3] = "Music"
optionMenuText[0, 4] = "SFX"

optionMenuText[1, 0] = "解析度"
optionMenuText[1, 1] = "全螢幕"
optionMenuText[1, 2] = "語言"
optionMenuText[1, 3] = "音樂"
optionMenuText[1, 4] = "音效"
//背景
DrawOptionBackground_X = 96 * global.windowsSize
DrawOptionBackground_Y = 36 * global.windowsSize
DrawOptionBackground_W = 448 * global.windowsSize
DrawOptionBackground_H = 288 * global.windowsSize
//左側文字
DrawOptionTextStart_X = 128 * global.windowsSize
DrawOptionTextStart_Y = 65 * global.windowsSize
DrawOptionTextBoxHeight = 55 * global.windowsSize
//右側文字
optionContentStart_X = 320
optionContentEND_X = 490
optionContentStart_Y = 65
optionContentBoxHeight = 55

DrawOptionContentStart_X = optionContentStart_X * global.windowsSize
DrawOptionContentEND_X = optionContentEND_X * global.windowsSize
DrawOptionContentStart_Y = optionContentStart_Y * global.windowsSize
DrawOptionContentBoxHeight = optionContentBoxHeight * global.windowsSize
//箭頭
optionArrow_W = sprite_get_width(sMenuArrowLeft)
optionArrow_H = sprite_get_height(sMenuArrowLeft)

DrawOptionArrow_W = optionArrow_W * global.windowsSize
DrawOptionArrow_H = optionArrow_H * global.windowsSize

// 底線
optionLineX1 = DrawOptionTextStart_X
optionLineX2 = DrawOptionContentEND_X + DrawOptionArrow_W

//全螢幕的框框
DFSx1 = 403 * global.windowsSize
DFSx2 = 429 * global.windowsSize
DFSy1 = 104 * global.windowsSize
DFSy2 = 130 * global.windowsSize

FSx1 = 403 
FSx2 = 429
FSy1 = 104
FSy2 = 130 


optionCursor = 0
#endregion


//文字設定
MenuFontSize = 11 * global.windowsSize
optionFontSize = 15 * global.windowsSize
MenuFont = font_add(LanguageFont[global.gameLanguage], MenuFontSize, false, false, 0, 65535)
ChooseCuesor = font_add("EquipmentPro.ttf", 17 * global.windowsSize, false, false, 0, 65535)
optionFont = font_add(LanguageFont[global.gameLanguage], optionFontSize, false, false, 0, 65535)
