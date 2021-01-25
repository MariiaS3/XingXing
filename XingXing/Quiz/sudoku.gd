extends Control

var i=0
var j=0
var t=9
var reward = 7
var index = PlayerReward.index

onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $ColorRect
onready var check_the_result: Label = get_node("ColorRect/Label")

var paused: = false setget set_paused


var select_position_index = [0,0]
var sudoku_grid
var grid_origin
var check_result = 3

func _ready():
# warning-ignore:return_value_discarded
	PlayerData.connect("sudoku", self, "clear_grid")
	
func clear_grid():
	self.paused = true
	check_the_result.text = "Check the result: %s" % check_result
	sudoku_grid = [
		[  0, 0, 2, 5, 0, 9, 6, 1, 7],
		[  0, 1, 0, 4, 6, 7, 0, 2, 0],
		[  7, 0, 6, 1, 0, 0, 8, 0, 4],
		[  6, 0, 5, 0, 4, 1, 7, 0, 0],
		[  0, 2, 7, 9, 3, 0, 5, 0, 1],
		[  1, 3, 0, 0, 0, 8, 2, 6, 0],
		[  5, 0, 1, 8, 7, 0, 9, 3, 2],
		[  0, 8, 0, 3, 0, 5, 0, 7, 0],
		[  4, 0, 3, 6, 0, 2, 1, 0, 8]
	]
	# This is not needed on the first load of the program
	# But is needed more for when the user presses the reset button
	for y in range (0, sudoku_grid.size()):
		for x in range(0, sudoku_grid.size()):
			var number = sudoku_grid[y][x]
			$ColorRect/grid_tiles.set_cell(x, y, number - 1)
	$ColorRect/grid_tiles.set_cell(0, 0,9)
	result()


func _unhandled_input(_event: InputEvent) -> void:
	if t==9:
		$ColorRect/grid_tiles.set_cell(j,i,9)

func result():
	grid_origin = [
		[3,4,2,5,8,9,6,1,7],
		[9,1,8,4,6,7,3,2,5],
		[7,5,6,1,2,3,8,9,4],
		[6,9,5,2,4,1,7,8,3],
		[8,2,7,9,3,6,5,4,1],
		[1,3,4,7,5,8,2,6,8],
		[5,6,1,8,7,4,9,3,2],
		[2,8,9,3,1,5,4,7,6],
		[4,7,3,6,9,2,1,5,8],
	]
	

func _on_UP_pressed():
	var tile_1
	if i>0:
		i=i-1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j,i+1)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j,i+1,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if i==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	


func _on_RIGHT_pressed():
	if j<8:
		j=j+1
	var tile_1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j-1,i)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j-1,i,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if j==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j

	
	

func _on_LEFT_pressed():
	if j>0:
		j=j-1
	var tile_1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j+1,i)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j+1,i,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if j==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j


func _on_DOWN_pressed():
	if i<8:
		i=i+1
	var tile_1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j,i-1)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j,i-1,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if i==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	

func _on_ENTER_pressed():
	if check_result!=0:
		for y in range (0, sudoku_grid.size()):
			for x in range(0, sudoku_grid.size()):
				if(sudoku_grid[x][y]!=grid_origin[x][y]):
					if(sudoku_grid[x][y]==1):
						$ColorRect/grid_tiles.set_cell(y, x,10)
					if(sudoku_grid[x][y]==2):
						$ColorRect/grid_tiles.set_cell(y, x,11)
					if(sudoku_grid[x][y]==3):
						$ColorRect/grid_tiles.set_cell(y, x,12)
					if(sudoku_grid[x][y]==4):
						$ColorRect/grid_tiles.set_cell(y, x,13)
					if(sudoku_grid[x][y]==5):
						$ColorRect/grid_tiles.set_cell(y, x,14)
					if(sudoku_grid[x][y]==6):
						$ColorRect/grid_tiles.set_cell(y, x,15)
					if(sudoku_grid[x][y]==7):
						$ColorRect/grid_tiles.set_cell(y, x,16)
					if(sudoku_grid[x][y]==8):
						$ColorRect/grid_tiles.set_cell(y, x,17)
		check_result = check_result-1
		reward = reward-1
		check_the_result.text = "Check the result: %s" % check_result


func _on_1_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],0)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=1


func _on_2_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],1)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=2

func _on_3_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],2)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=3



func _on_4_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],3)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=4


func _on_5_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],4)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=5


func _on_6_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],5)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=6


func _on_7_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],6)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=7


func _on_8_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],7)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=8

	
func _on_9_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],8)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=9



func _on_0_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]!=0 &&  sudoku_grid[select_position_index[0]][select_position_index[1]] !=  grid_origin[select_position_index[0]][select_position_index[1]]:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],9)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=0



func _on_SOLVED_pressed():
	for y in range (0, sudoku_grid.size()):
			for x in range(0, sudoku_grid.size()):
				if sudoku_grid[y][x] != grid_origin[y][x]:
					t=t-1
					if t==2 || t==4 || t==6  || t==0 :
						reward = reward-1
	if reward !=0:
		PlayerReward.index += reward
		PlayerReward.add_item(PlayerReward.index-reward)
		get_tree().paused= false
		self.paused = false
	else:
		get_tree().paused= false
		self.paused = false


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
