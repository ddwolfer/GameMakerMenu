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
gameLanguage = 0
MainMenuTextStartPosition_X = window_get_width()/40
MainMenuTextStartPosition_Y = window_get_height()/2
TextBoxHeight = 60
TextBoxWidth = 250
MainMenuCursor = 0

mainMenuText[0, 0] = "NEW GAME"
mainMenuText[0, 1] = "LOAD"
mainMenuText[0, 2] = "SETTING"
mainMenuText[0, 3] = "EXIT"

mainMenuText[1, 0] = "新遊戲"
mainMenuText[1, 1] = "載入遊戲"
mainMenuText[1, 2] = "設定"
mainMenuText[1, 3] = "離開"