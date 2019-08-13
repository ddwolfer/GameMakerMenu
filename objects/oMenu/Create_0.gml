/// @description 變數設置
// You can write your code in this editor
getInput()
//目前畫面
enum menuScreen{
	newgame = 0,
	load = 1,
	option = 2,
	exitgame = 3,
	main = 4
}
menuScreen = menuScreen.main
//基礎設定
windowsSize = window_get_width()/640 //視窗大小 最小為640*360 以此為底算倍數
gameLanguage = 0
gameMusic = 10
gameSFX = 10
MenuFont = font_add("EquipmentPro.ttf", 12*windowsSize, false, false, 0, 65535)
ChooseCuesor = font_add("EquipmentPro.ttf", 17*windowsSize, false, false, 0, 65535)
//main page 設定
MainMenuTextStartPosition_X = window_get_width()/40
MainMenuTextStartPosition_Y = window_get_height()/2
TextBoxHeight = 30 * windowsSize
TextBoxWidth = 125 * windowsSize
MainMenuCursor = 0
//option page 設定
optionFont = font_add("EquipmentPro.ttf", 20*windowsSize, false, false, 0, 65535)
optionTextStart_X = (window_get_width()/5 ) 
optionTextStart_Y = (window_get_height()/5.5 ) 
optionTextBoxHeight = 55 * windowsSize

optionContentStart_X = (window_get_width()/2 )
optionContentEND_X = (window_get_width()/1.25 ) 
optionContentStart_Y = optionTextStart_Y 
optionContentBoxHeight = optionTextBoxHeight


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

//解析度大小 (640*360 的幾倍)
resolution[0] = "640*360" 
resolution[1] = "1280*720" 
resolution[2] = "1440*810" 
resolution[3] = "1920*1080" 

//語言
LanguageOption[0] = "English"
LanguageOption[1] = "Chinese"
