//基礎設定
var rootList = ds_list_create()
var map = ds_map_create()
ds_list_add(rootList,map)
ds_list_mark_as_map(rootList, ds_list_size(rootList) - 1)
//放入需要存的資料
//ds_map_add(map,"obj",object_get_name(object_index))
ds_map_add(map,"Language", global.gameLanguage)
ds_map_add(map,"Music", global.gameMusic)
ds_map_add(map,"SFX", global.gameSFX)
ds_map_add(map,"Resolution", global.gameResolution)
ds_map_add(map,"FullScreen", global.gameFullScreen)

//將以上的資料包起來(warpper)
var wrapper = ds_map_create()
ds_map_add_list(wrapper, "System", rootList) //此sav的Title
//轉成string做成.sav
var saveStr = json_encode(wrapper)
SaveStringToFile("saveSystem.sav", saveStr)	
show_debug_message(saveStr)
//釋放記憶體
ds_map_destroy(wrapper)
ds_map_destroy(map)

