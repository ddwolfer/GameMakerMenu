/// @description 變數設置
// You can write your code in this editor
getInput()

//目前畫面
enum menuScreen{
	newgame = 0,
	load = 1,
	option = 2,
	exitgame = 3,
	main = 4,
	deleteGame = 5,
	loading = 6
}
menuScreen = menuScreen.loading
#region 文字內容
//語言
LanguageOption[0] = "English"
LanguageOption[1] = "繁體中文"

LanguageFont[0] = "EquipmentPro.ttf"
LanguageFont[1] = "Chinese.ttf"
//主畫面文字
mainMenuText[0, 0] = "NEW GAME"
mainMenuText[0, 1] = "LOAD"
mainMenuText[0, 2] = "OPTION"
mainMenuText[0, 3] = "EXIT"

mainMenuText[1, 0] = "新遊戲"
mainMenuText[1, 1] = "載入遊戲"
mainMenuText[1, 2] = "設定"
mainMenuText[1, 3] = "離開"

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

//刪除用文字
DeleteAlarm[0, 0] = "Sure to delete this save?"
DeleteAlarm[1, 0] = "確定要刪除這個存檔嗎?"

YesOrNo [0, 0] ="No"
YesOrNo [0, 1] ="Yes"

YesOrNo [1, 0] ="否"
YesOrNo [1, 1] ="是"

#endregion

//基礎設定 (如果有開過遊戲就讀system)
MainMenuCursor = 0
deleteFromLoad = 0
deleteFromNew = 0
//文字設定
MenuFontSize = 11 * global.windowsSize
optionFontSize = 15 * global.windowsSize
MenuFont = font_add(LanguageFont[global.gameLanguage], MenuFontSize, false, false, 0, 65535)
ChooseCuesor = font_add("EquipmentPro.ttf", 17 * global.windowsSize, false, false, 0, 65535)
optionFont = font_add(LanguageFont[global.gameLanguage], optionFontSize, false, false, 0, 65535)

#region main page 設定
//判斷滑鼠位置用 (與著色不同 可以直接抓room的位置去判斷 不會因draw函數受到影響)
MainTextStart_X = 16
MainTextStart_Y = 180
TextBoxHeight = 30
TextBoxWidth = 125
//上色與圖片用的變數 (著色要隨著螢幕大小作變化 因受限於GM2的draw函數 必須要依照Viewport做變化)
DrawMainTextStart_X = MainTextStart_X * global.windowsSize
DrawMainTextStart_Y = MainTextStart_Y * global.windowsSize
DrawTextBoxHeight = TextBoxHeight * global.windowsSize
DrawTextBoxWidth = TextBoxWidth * global.windowsSize
#endregion

#region option page 設定
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
//全螢幕的框框
DFSx1 = 403 * global.windowsSize
DFSx2 = 429 * global.windowsSize
DFSy1 = 104 * global.windowsSize
DFSy2 = 130 * global.windowsSize

FSx1 = 403 
FSx2 = 429
FSy1 = 104
FSy2 = 130 
#endregion

#region Load page 設定
LoadStart_X = 126
LoadStart_Y = 66
LoadBoxWidth = 388
LoadBoxHeight = 60
LoadBoxSpace = 24

deleteStart_X = 520
deleteEnd_X = deleteStart_X + 18
deleteStart_Y = 89
deleteEnd_Y = deleteStart_Y + 18

DrawLoadBoxTitle_X = 111 * global.windowsSize
DrawLoadBoxTitle_Y = 56 * global.windowsSize
DrawLoadBoxTitle_W = 50 * global.windowsSize
DrawLoadBoxTitle_H = 20 * global.windowsSize

DrawLoadStart_X = LoadStart_X * global.windowsSize
DrawLoadStart_Y = LoadStart_Y * global.windowsSize
DrawLoadBoxWidth = LoadBoxWidth * global.windowsSize
DrawLoadBoxHeight = LoadBoxHeight * global.windowsSize
DrawLoadBoxSpace = LoadBoxSpace * global.windowsSize

DrawDeleteStart_X = deleteStart_X * global.windowsSize
DrawDeleteEnd_X = deleteEnd_X * global.windowsSize
DrawDeleteStart_Y = deleteStart_Y * global.windowsSize
DrawDeleteEnd_Y = deleteEnd_Y * global.windowsSize

saveTime[0] = "00:00:00"
saveTime[1] = "00:00:00"
saveTime[2] = "00:00:00"
getsaveTime = 0

alarm[1] = 30

#endregion

#region delete page 設定
DeleteBackgroundX1 = 200 * global.windowsSize
DeleteBackgroundX2 = 440 * global.windowsSize
DeleteBackgroundY1 = 100 * global.windowsSize
DeleteBackgroundY2 = 220 * global.windowsSize

DrawDeleteAlarm_X = 320 * global.windowsSize
DrawDeleteAlarm_Y = ((360/2) - 40) * global.windowsSize

DrawYesText_X = ((640/2) - 40)  * global.windowsSize
DrawNoText_X =  ((640/2) + 40) * global.windowsSize
DrawCheckText_Y = (360/2 + 10) * global.windowsSize

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



